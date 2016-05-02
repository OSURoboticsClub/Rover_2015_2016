#!/usr/bin/env python
import rospy
from std_msgs.msg import Bool
from pkg.msg import Coords3D
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import cv2
import sys
sys.path.insert(0, 'scripts')
import Color_Filter
import detector
import numpy
import math

halt_scan = False
new_left_img = None
new_right_img = None
bridge = CvBridge()

# temporary, for testing
cv2.startWindowThread()
cv2.namedWindow('LEFT')
cv2.namedWindow('RIGHT')
#cv2.namedWindow('LEFT_RAW')
#cv2.namedWindow('RIGHT_RAW')

def grab_handle(grab_succ):
    rospy.loginfo(rospy.get_caller_id() + 
                  " grab was successful" if grab_succ else "grab failed")
    global halt_scan
    halt_scan = False

def left_scan(img):
    global new_left_img
    # convert ROS image message to numpy array for OpenCV
    try:
        new_left_img = bridge.imgmsg_to_cv2(img, "bgr8")
    except CvBridgeError as e:
        rospy.logerror(e)

def right_scan(img):
    global new_right_img
    # convert ROS image message to numpy array for OpenCV
    try:
        new_right_img = bridge.imgmsg_to_cv2(img, desired_encoding="bgr8")
    except CvBridgeError as e:
        rospy.logerror(e)

def calculate_distance(left_centx, right_centx, left_centy, right_centy):
    distance_between_cameras = 95.25
    height_of_cameras = 1009.65
    view_angle = 78
    resolution_width = 1920
    resolution_height = 1080
    x_offset = 0.4926
    y_offset = 0.4396
    
    # equation to calulcate distance from camera (in mm):
    # D = (B*x0)/(2*tan(a0/2)*(xl-xd))
    # B -> distance between cameras
    # x0 -> number of horizontal pixels in image (640 right now)
    # a0 -> field of view (60 degrees for webcams)
    # (xl-xd) -> horizontal difference between the same object on both images (diff)
    # This will change each time the rover is calibrated
    diff = abs(left_centx-right_centx)
    if diff != 0:
       dist = ((distance_between_cameras*resolution_width)/(2*math.tan(math.radians(view_angle)/2)*diff))# * 1.75
    else: return None
    

    # calculate x-value in mm using basic trigonometry and ratios
    # dx0 -> distance from center of field of view (left camera) to horizontal edge of FOV in mm
    # dx1 -> distance from center of FOV (left camera) to centroid of purple
    # x -> distance from center of stereo cameras to purple centroid in mm
    dx0 = dist * math.tan(math.radians(view_angle/2))
    dx1 = (dx0 * (left_centx - (resolution_width/2))) / (resolution_width/2)
    #x = dx1 + 59.5
    x = (dx1 - 100) * x_offset

    # calculate y-value in mm
    # dy0 -> distance from center of FOV (left camera) to vertical edge of FOV in mm
    # y -> distance from center of stereo cameras to purple centroid in mm
    dy0 = (dx0 * (resolution_height/2)) / (resolution_width/2)
    y = (((dy0 * (left_centy - (resolution_height/2))) / (resolution_height/2)) * -1)

    # calculate distance from base of rover
    # h -> height of cameras from ground in mm
    # assumes flat surface
    try:
        z = math.sqrt(math.pow(dist, 2) - math.pow(height_of_cameras, 2)) * y_offset
        return (x,y,z)
    except ValueError:
        rospy.loginfo("too close")
        return (x,y,0)

def check_precached(left, right):

    # check if precached sample is in the view of the left and right images
    # and return its coordinates if it is
    
    xyz = None
    left_detect = detector.detect_precached(left)
    right_detect = detector.detect_precached(right)

    if left_detect is not None and right_detect is not None:
        xyz = calculate_distance(left_detect[0], right_detect[0], left_detect[1], right_detect[1])
        rospy.loginfo("Precached:(x,y,z): {0}".format(xyz))
    return xyz

def check_easy_sample(left, right):
       xyz = None

       # filter image so that only purple objects show up in each image
       filter_left = Color_Filter.filter_colors(frame=left, show_images=False, verbose=False)
       filter_right = Color_Filter.filter_colors(frame=right, show_images=False, verbose=False)

       # detect edges of the purple objects in each image
       edges_left = Color_Filter.contour_color(frame=filter_left["Median Blur"][filter_left["Colors"][0]], show_images=False)
       edges_right = Color_Filter.contour_color(frame=filter_right["Median Blur"][filter_right["Colors"][0]], show_images=False)

       #cv2.imshow('LEFT', edges_left)
       #cv2.imshow('RIGHT', edges_right)

       # blur to create consistency
       #blurred_left = cv2.GaussianBlur(edges_left, (5,5), 0)
       #blurred_right = cv2.GaussianBlur(edges_right, (5,5), 0)
       
       # find image contours
       (cnts_left, _) = cv2.findContours(edges_left.copy(), cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)
       (cnts_right, _) = cv2.findContours(edges_right.copy(), cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)
       
       if cnts_left and cnts_right:
           
           # take the biggest contour from each image and calculate their centroids

           left_cont = max(cnts_left, key = cv2.contourArea)
           right_cont = max(cnts_right, key = cv2.contourArea)
           left_moments = cv2.moments(left_cont)
           right_moments = cv2.moments(right_cont)
           if left_moments['m00'] != 0 and right_moments['m00'] != 0:
              left_centx = int(left_moments['m10']/left_moments['m00'])
              right_centx = int(right_moments['m10']/right_moments['m00'])
              left_centy = int(left_moments['m01']/left_moments['m00'])
              right_centy = int(right_moments['m01']/right_moments['m00'])

              # calulcate distance from camera (in mm):
	      xyz = calculate_distance(left_centx, right_centx, left_centy, right_centy)
              rospy.loginfo("Easy_Sample:(x,y,z): {0}".format(xyz))
	      
           else:
              rospy.loginfo("DIVIDE BY ZERO")
      
       elif cnts_left and not cnts_right:
            rospy.loginfo("Spotted on the left. Need to turn left");
	    return ("Left", None)

       elif cnts_right and not cnts_left:
            rospy.loginfo("Spotted on the right. Need to turn right");
	    return ("Right", None)
       
       else:
           rospy.loginfo("NO PURPLE")
           return None

       # print for testing only
       cv2.imshow('LEFT', blurred_left)
       cv2.imshow('RIGHT', blurred_right)

       # returns a tuple (x,y,z), or None if no sample is detected
       print "see thing at "+str(xyz)
       return xyz

def scan_for_samples():

    # this function uses the sample cam to process images and determine 
    # whether or not there is a sample in the rover's view
    # if there is a sample, it will calculate the distance from the 
    # base of the rover in the form (x,y,z) [meters?]

    coords = None
    precached = False
    curr_left_img = new_left_img
    curr_right_img = new_right_img
    if curr_left_img is not None and curr_right_img is not None:
       
       #cv2.imshow('LEFT_RAW', curr_left_img)
       #cv2.imshow('RIGHT_RAW', curr_right_img)

       coords = check_precached(curr_left_img, curr_right_img)
       if coords is None:
          coords = check_easy_sample(curr_left_img, curr_right_img)
       else:
          precached = True
       
       if coords is None: 
          rospy.loginfo("No Samples found")

    # coords: (x,y,z), or None if no sample is detected
    # precached: True if sample is precached
    if coords is not None:
        return (coords, precached)
    else:
        return None

def scan():

    # publishes float lists to the sample_coords topic (consumed by nav)
    pub = rospy.Publisher('sample_coords', Coords3D, queue_size=10)

    # initialize node and name it scan
    rospy.init_node('scan', anonymous=False)
    rospy.loginfo("entered scan state")

    rospy.Subscriber('grab_success', Bool, grab_handle)

    # scan cam images
    rospy.Subscriber('stereo/left/image_rect_color', Image, left_scan)
    rospy.Subscriber('stereo/right/image_rect_color', Image, right_scan)

    #rate = rospy.Rate(10) # 10hz, loop will run 10 times/second maximum

    while not rospy.is_shutdown():
        
        (coords, precached) = scan_for_samples()
        if coords is not None:
            rospy.loginfo("sample detected by sample cam at " +
                          "({0},{1},{2})".format(
                          coords[0], coords[1], coords[2]))
            if precached:
               rospy.loginfo('sample type: precached')
            else:
               rospy.loginfo('sample type: easy')
            pub.publish(coords[0], coords[1], coords[2], precached)
            global halt_scan
            halt_scan = True
            rospy.loginfo("scan has been halted")
            while(halt_scan):
                # do nothing until grab finishes
                rate.sleep()
                        
            rospy.loginfo("returning to scan state")

        #rate.sleep()

if __name__ == '__main__':
    try:
        scan()
    except rospy.ROSInterruptException:
        pass
