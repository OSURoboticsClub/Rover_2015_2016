#!/usr/bin/env python
import rospy
from std_msgs.msg import Bool
from pkg.msg import Coords3D
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import cv2

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
    # convert ROS image message to IplImage for OpenCV
    try:
        new_left_img = bridge.imgmsg_to_cv2(img, "bgr8")
    except CvBridgeError as e:
        rospy.logerror(e)
    cv2.imshow('LEFT', new_left_img) # temporary display for testing

def right_scan(img):
    global new_right_img
    # convert ROS image message to IplImage for OpenCV
    try:
        new_right_img = bridge.imgmsg_to_cv2(img, "bgr8")
    except CvBridgeError as e:
        rospy.logerror(e)
    cv2.imshow('RIGHT', new_right_img) # temporary display for testing

def scan_for_samples():

    # TODO: 
    # this function uses the sample cam to process images and determine 
    # whether or not there is a sample in the rover's view
    # if there is a sample, it will calculate the distance from the 
    # base of the rover in the form (x,y,z) [meters?]

    

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
