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
    
    # equation to calulcate distance from camera (in mm):
    # D = (B*x0)/(2*tan(a0/2)*(xl-xd))
    # B -> distance between cameras
    # x0 -> number of horizontal pixels in image (640 right now)
    # a0 -> field of view (60 degrees for webcams)
    # (xl-xd) -> horizontal difference between the same object on both images (diff)
    # This will have to be changed once the cameras are calibrated for the rover
    # Assumes distance between cameras is 119mm and resolution 640x480
    diff = abs(left_centx-right_centx)
    dist = ((119*1280)/(2*math.tan(math.radians(60)/2)*diff))# * 1.75

    # calculate x-value in mm using basic trigonometry and ratios
    # dx0 -> distance from center of field of view (left camera) to horizontal edge of FOV in mm
    # dx1 -> distance from center of FOV (left camera) to centroid of purple
    # x -> distance from center of stereo cameras to purple centroid in mm
    dx0 = dist * math.tan(math.radians(30))
    dx1 = (dx0 * (left_centx - 640)) / (640)
    #x = dx1 + 59.5
    x = (dx1 - 100) #/ 1.75

    # calculate y-value in mm
    # dy0 -> distance from center of FOV (left camera) to vertical edge of FOV in mm
    # y -> distance from center of stereo cameras to purple centroid in mm
    dy0 = (dx0 * 360) / (640)
    y = (((dy0 * (left_centy - 360)) / (360)) * -1)# / 1.75

    # calculate distance from base of rover
    # h -> height of cameras from ground in mm
    # assumes sample is detected at same level as the rover...
    h = 228.6
    try:
        z = math.sqrt(math.pow(dist, 2) - math.pow(h, 2))
        return (x,y,z)
    except ValueError:
        rospy.loginfo("too close")
        return None

def check_precached(left, right):

    # check if precached sample is in the view of the left and right images
    # and return its coordinates if it is
    
    xyz = None
    left_detect = detector.detect_precached(left)
    right_detect = detector.detect_precached(right)
    if left_detect is not None and right_detect is not None:
        xyz = calculate_distance(left_detect[0], right_detect[0], left_detect[1], right_detect[1])
    return xyz

def check_easy_sample(left, right):

       # filter image so that only purple objects show up in each image
       filter_left = Color_Filter.filter_colors(frame=left, show_images=False, verbose=False)
       filter_right = Color_Filter.filter_colors(frame=right, show_images=False, verbose=False)

       # detect edges of the purple objects in each image
       edges_left = Color_Filter.contour_color(frame=filter_left["Median Blur"][filter_left["Colors"][0]], show_images=False)
       edges_right = Color_Filter.contour_color(frame=filter_right["Median Blur"][filter_right["Colors"][0]], show_images=False)

       # blur to create consistency
       #blurred_left = cv2.GaussianBlur(edges_left, (5,5), 0)
       #blurred_right = cv2.GaussianBlur(edges_right, (5,5), 0)
       
       # find image contours
       (cnts_left, _) = cv2.findContours(blurred_left.copy(), cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)
       (cnts_right, _) = cv2.findContours(blurred_right.copy(), cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)
       if cnts_left and cnts_right:
           
           # take the biggest contour from each image and calculate their centroids
           left_cont = max(cnts_left, key = cv2.contourArea)
           right_cont = max(cnts_right, key = cv2.contourArea)
           left_moments = cv2.moments(left_cont)
           right_moments = cv2.moments(right_cont)
           left_centx = int(left_moments['m10']/left_moments['m00'])
           right_centx = int(right_moments['m10']/right_moments['m00'])
           left_centy = int(left_moments['m01']/left_moments['m00'])
           right_centy = int(right_moments['m01']/right_moments['m00'])

           # calulcate distance from camera (in mm):
	   xyz = calculate_distance(left_centx, right_centx, left_centy, right_centy)
           rospy.loginfo("(x,y,z): {0}".format(xyz))
          
       else:
           rospy.loginfo("NO PURPLE")
           return None

       # print for testing only
       cv2.imshow('LEFT', blurred_left)
       cv2.imshow('RIGHT', blurred_right)

       # returns a tuple (x,y,z), or None if no sample is detected
       return xyz

def scan_for_samples():

    # TODO: 
    # this function uses the sample cam to process images and determine 
    # whether or not there is a sample in the rover's view
    # if there is a sample, it will calculate the distance from the 
    # base of the rover in the form (x,y,z) [meters?]

    coords = None
    curr_left_img = new_left_img
    curr_right_img = new_right_img
    if curr_left_img is not None and curr_right_img is not None:
       
       coords = check_precached(curr_left_img, curr_right_img)
       if coords is None:
           coords = check_easy_sample(curr_left_img, curr_right_img)

    # returns a tuple (x,y,z), or None if no sample is detected
    if coords is not None:
        return coords
    else:
        return None

def scan():

    # publishes float lists to the sample_coords topic (consumed by nav)
    pub = rospy.Publisher('sample_coords', Coords3D, queue_size=10)

    # initialize node and name it scan
    rospy.init_node('scan', anonymous=False)
    rospy.loginfo("entered scan state")

    # subscribe this node to the grab_success topic (published by grab)
    rospy.Subscriber('grab_success', Bool, grab_handle)

    # scan cam images
    rospy.Subscriber('stereo/left/image_rect_color', Image, left_scan)
    rospy.Subscriber('stereo/right/image_rect_color', Image, right_scan)

    rate = rospy.Rate(10) # 10hz, loop will run 10 times/second maximum

    while not rospy.is_shutdown():
        
        coords = scan_for_samples()
        '''
        if coords is not None:
            rospy.loginfo("sample detected by sample cam at " +
                          "({0},{1},{2})".format(
                          coords[0], coords[1], coords[2]))
            pub.publish(coords[0], coords[1], coords[2])
            global halt_scan
            halt_scan = True
            rospy.loginfo("scan has been halted")
            while(halt_scan):
                # do nothing until grab finishes
                rospy.loginfo
                rate.sleep()
                        
            rospy.loginfo("returning to scan state")
        '''
        rate.sleep()

if __name__ == '__main__':
    try:
        scan()
    except rospy.ROSInterruptException:
        pass
