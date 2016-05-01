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
import nav

new_crotch_img2 = None
scan_img_left = None
scan_img_right = None
bridge = CvBridge()

cv2.startWindowThread()
cv2.namedWindow('LEFT')
cv2.namedWindow('RIGHT')

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

def test_scan_easy():

    while not rospy.is_shutdown():
        coords = scan.check_easy_sample(scan_img_left, scan_img_right)
        rospy.loginfo("coords: " + str(coords))
        cv2.imshow('LEFT', scan_img_left)
        cv2.imshow('RIGHT', scan_img_right)

def test_scan_precached():

    while not rospy.is_shutdown():
        coords = scan.check_precached(scan_img_left, scan_img_right)
        rospy.loginfo("coords: " + str(coords))
        cv2.imshow('LEFT', scan_img_left)
        cv2.imshow('RIGHT', scan_img_right)

# moves forward until scan cam sees sample,
# then stops and returns coordinates
# also moves the arm out of the way afterwards
def test_forward_until_scanned(u, precached):
    coords = None

    # MOVE FORWARD until sample is seen by scan cam
    u.motor_right(0.1)
    u.motor_left(0.1)
    while coords is None:
       if precached:
           coords = scan.check_precached(scan_img_left, scan_img_right)
       else:
           coords = scan.check_easy_sample(scan_img_left, scan_img_right)
   
    print "saw at thing" 
    # once sample is seen, stop and move arm back
    u.motor_left(0.0)
    u.motor_right(0.0)
    time.sleep(1)
    rospy.loginfo("coords: " + str(coords))

    u.arm_target("X", 0)
    u.arm_target("Y", u.arm_max("Y"))
    while u.arm_should_be_moving("X") or u.arm_should_be_moving("Y"): pass   
    
    return coords

# tests a basic arm pickup for easy sample
def test_pickup_easy(u):
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
          grab.place_sample(u,1)
       else:
          rospy.loginfo("no sample detected")

def test_pickup_precached(u):
    
    u.motor_left(0.1)
    u.motor_right(0.1)
    time.sleep(3)

def test_scan_and_grab_easy(u):
   
    # move forward until scan cam sees sample 
    coords = test_forward_until_scanned(u, False)

    # turn so that the sample is in front of the rover
    nav.turn_to_sample(u, coords, False)

    # move forward until the sample is seen by the pit cam, and park over it
    nav.move_til_sample(u, False)

    # pick up sample
    test_pickup_easy(u)

def test_scan_and_grab_precached(u):
    coords = test_forward_until_scanned(u, True)

    nav.turn_to_sample(u, coords, True)

    nav.move_til_sample(u, True)

    test_pickup_precached(u)

def test_forward_until_scanned_both(u):
    coords = None
    precached = False # is the scanned sample precached or easy?

    # MOVE FORWARD until sample is seen by scan cam
    u.motor_right(0.1)
    u.motor_left(0.1)

    while coords is None:
       coords = scan.check_precached(scan_img_left, scan_img_right)
       if coords is None:
           coords = scan.check_easy_sample(scan_img_left, scan_img_right)
       else:
           precached = True
   
    print "saw at thing" 
    # once sample is seen, stop and move arm back
    u.motor_left(0.0)
    u.motor_right(0.0)
    time.sleep(1)
    rospy.loginfo("coords: " + str(coords))

    u.arm_target("X", 0)
    u.arm_target("Y", u.arm_max("Y"))
    while u.arm_should_be_moving("X") or u.arm_should_be_moving("Y"): pass   
    
    return (coords, precached)


def full_obj_rec_test(u):
    coords = test_forward_until_scanned_both(u)
    if coords[1]:
        rospy.loginfo("precached sample detected")
        nav.turn_to_sample(u, coords, True)
        nav.move_til_sample(u, True)
        test_pickup_precached(u)
    else:
        rospy.loginfo("easy sample detected")
        nav.turn_to_sample(u, coords, False)
        nav.move_til_sample(u, False)
        test_pickup_easy(u)

def tests():
    rospy.init_node('tests', anonymous=False)
    rospy.loginfo('node initialized')    
    rospy.Subscriber('crotch/image/image_raw', Image, handle_img)
    rospy.Subscriber('stereo/left/image_rect_color', Image, handle_scan_left)
    rospy.Subscriber('stereo/right/image_rect_color', Image, handle_scan_right)
    #rate = rospy.Rate(10)
    u = uniboard.Uniboard("/dev/ttyUSB1")
    u.arm_home()
    
    # comment out all but one test

    #test_forward_until_scanned_easy(u, False)
    #nav.move_til_sample(u, False)
    #test_pickup_easy(u)
    #test_scan_and_grab_easy(u)
    #test_pickup_precached(u)
    #test_scan_and_grab_precached(u)
    #test_forward_until_scanned_both(u)
    #test_scan_easy()
    #test_scan_precached()
    full_obj_rec_test(u)

if __name__ == '__main__':
    try:
        tests()
    except rospy.ROSInterruptException:
        pass
