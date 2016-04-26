#!/usr/bin/env python
import rospy
import grab
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import time
import sys
sys.path.insert(0, "../../../../uniboard/roverlib")
import uniboard
import math
import arm
import scan

new_crotch_img2 = None
scan_img_left = None
scan_img_right = None
bridge = CvBridge()

def handle_scan_left(img):
    global scan_img_left
    try:
        scan_img_left = bridge.imgmsg_to_cv2(img, "bgr8")
    except CvBridgeError as e:
        rospy.logerror(e)

def handle_scan_right(img):
    global scan_img_right
    try:
        scan_img_right = bridge.imgmsg_to_cv2(img, "bgr8")
    except CvBridgeError as e:
        rospy.logerror(e)

def handle_img(img):
    global new_crotch_img2
    # convert ROS image message to numpy array for OpenCV
    try:
        new_crotch_img2 = bridge.imgmsg_to_cv2(img, "bgr8")
    except CvBridgeError as e:
        rospy.logerror(e)

def turn_to_sample(coords):
    
    while coords[0] < 50 and coords[0] > -50:
       if coords[0] > 0:
          u.motor_left(0.1)
          u.motor_right(-0.1)
          time.sleep(1)
          u.motor_left(0.0)
          u.motor_right(0.0)
          coords = scan.check_easy_sample(scan_img_left, scan_img_right)
       elif coords[0] <= 0:
          u.motor_left(-0.1)
          u.motor_right(0.1)
          time.sleep(1)
          u.motor_right(0.0)
          u.motor_left(0.0)
          coords = scan.check_for_easy_sample(scan_img_left, scan_img_right)

def test_scan_and_grab(u):
    
    coords = None

    # MOVE FORWARD until sample is seen by scan cam
    u.motor_right(0.1)
    u.motor_left(0.1)
    while coords is None: 
       coords = scan.check_easy_sample(scan_img_left, scan_img_right)
    
    # once sample is seen, stop and move arm back
    u.motor_left(0.0)
    u.motor_right(0.0)
    time.sleep(1)
    rospy.loginfo("coords: " + str(coords))

    u.arm_target("X", 0)
    u.arm_target("Y", u.arm_max("Y"))
    while u.arm_should_be_moving("X") or u.arm_should_be_moving("Y"): pass

    # turn so that the sample is right in front of the rover
    turn_to_sample(coords)

    # move forward until the sample is seen by the pit cam, and park over it
    u.motor_right(0.1)
    u.motor_left(0.1)
    while not rospy.is_shutdown():
       curr_crotch_img = new_crotch_img2
       xy = grab.identify_easy_sample(curr_crotch_img) 
       while xy is None:
          xy = grab.identify_easy_sample(curr_crotch_img)
          time.sleep(1.5)
       u.motor_right(0.0)
       u.motor_left(0.0)
       break

    # PICK UP SAMPLE
    # move arm out of the way of the camera
    u.arm_target("X", 0)
    u.arm_target("Y", u.arm_max("Y"))
    while u.arm_should_be_moving("X") or u.arm_should_be_moving("Y"): pass
    time.sleep(1)
    if new_crotch_img2 is not None:
       curr_crotch_img = new_crotch_img2
       rospy.loginfo("image success")
       xy = grab.identify_easy_sample(curr_crotch_img)
       rospy.loginfo("coordinates: " + str(xy))
       if xy:
          rospy.loginfo("a sample has been detected")
          grab.pick_up_at(u,xy)
       else:
          rospy.loginfo("no sample detected")

def tests():
    rospy.init_node('tests', anonymous=False)
    rospy.loginfo('node initialized')    
    rospy.Subscriber('crotch/image/image_raw', Image, handle_img)
    rospy.Subscriber('stereo/left/image_rect_color', Image, handle_scan_left)
    rospy.Subscriber('stereo/right/image_rect_color', Image, handle_scan_right)
    rate = rospy.Rate(10)
    u = uniboard.Uniboard("/dev/ttyUSB1")
    u.arm_home()
    
    test_scan_and_grab(u)

if __name__ == '__main__':
    try:
        tests()
    except rospy.ROSInterruptException:
        pass
