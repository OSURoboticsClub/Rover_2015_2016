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
import numpy

halt_scan = False
new_left_img = 0
new_right_img = 0
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

def scan_for_samples():

    # TODO: 
    # this function uses the sample cam to process images and determine 
    # whether or not there is a sample in the rover's view
    # if there is a sample, it will calculate the distance from the 
    # base of the rover in the form (x,y,z) [meters?]

    curr_left_img = new_left_img
    curr_right_img = new_right_img
    if type(curr_left_img) is not int and type(curr_right_img) is not int:
       
       # filter image so that only purple objects show up in each image
       filter_left = Color_Filter.filter_colors(frame=curr_left_img, show_images=False, verbose=False)
       filter_right = Color_Filter.filter_colors(frame=curr_right_img, show_images=False, verbose=False)

       # detect edges of the purple objects in each image
       edges_left = Color_Filter.contour_color(frame=filter_left["Median Blur"][filter_left["Colors"][0]], show_images=False)
       edges_right = Color_Filter.contour_color(frame=filter_right["Median Blur"][filter_right["Colors"][0]], show_images=False)

       # blur to create consistency
       blurred_left = cv2.GaussianBlur(edges_left, (5,5), 0)
       blurred_right = cv2.GaussianBlur(edges_right, (5,5), 0)
       
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

           # equation to calulcate distance from camera:
           # D = (B*x0)/(2*tan(a0/2)*(xl-xd))
           # B -> distance between cameras
           # x0 -> number of horizontal pixels in image (640 right now)
           # a0 -> field of view (60 degrees for webcams)
           # (xl-xd) -> horizontal difference between the same object on both images (diff)
           diff = left_centx-right_centx
           dist = (119*640)/(1.1547*diff)
           #rospy.loginfo("lcx: " + str(left_centx) + "  rcx: " + str(right_centx))
           rospy.loginfo("dist: " + str(dist))
           
       else:
           rospy.loginfo("NO PURPLE")

       cv2.imshow('LEFT', blurred_left)
       cv2.imshow('RIGHT', blurred_right)

    # returns a tuple (x,y,z), or None if no sample is detected
    return (1.,1.,1.) # temporary value, for testing

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
