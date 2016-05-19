#!/usr/bin/env python
import rospy
import grab
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import numpy as np
import time
import sys
#sys.path.insert(0, "../../../../uniboard/roverlib")
import uniboard
import math
import arm
import scan
import nav
import cv2

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

def turn_to_sample(u, coords, precached):
    print "turning"
    rospy.loginfo("COORDS[0]: " + str(coords[0]))
    time_turn = 1.2
    while coords[0] > 40 or coords[0] < -40:
       if coords[0] > 0:
          rospy.loginfo("turn right")
          u.motor_left(0.22)
          u.motor_right(-0.22)
          time.sleep(time_turn)
          u.motor_left(0.0)
          u.motor_right(0.0)
          if precached:
              coords = scan.check_precached(scan_img_left, scan_img_right)
          else:
              coords = scan.check_easy_sample(scan_img_left, scan_img_right)
       elif coords[0] <= 0:
          rospy.loginfo("turn left")
          u.motor_left(-0.22)
          u.motor_right(0.22)
          time.sleep(time_turn)
          u.motor_right(0.0)
          u.motor_left(0.0)
          if precached:
              coords = scan.check_precached(scan_img_left, scan_img_right)
          else:
              coords = scan.check_easy_sample(scan_img_left, scan_img_right)
       # go forward a bit after each turn
       u.motor_right(0.1)
       u.motor_left(0.1)
       time.sleep(2)
       u.motor_right(0.0)
       u.motor_left(0.0)
       while coords is None:
          if precached:
              coords = scan.check_precached(scan_img_left, scan_img_right)
          else:
              coords = scan.check_easy_sample(scan_img_left, scan_img_right)
       if time_turn > 0.4:
          time_turn -= 0.1

def move_til_sample(u, precached):
    u.arm_target("X", 0)
    u.arm_target("Y", u.arm_max("Y"))
    while u.arm_should_be_moving("X") or u.arm_should_be_moving("Y"): pass
    u.motor_right(0.1)
    u.motor_left(0.1)
    while not rospy.is_shutdown():
       curr_crotch_img = new_crotch_img2
       xy = None
       while xy is None:
           curr_crotch_img = new_crotch_img2
           if precached:
               xy = grab.identify_precached(curr_crotch_img)
           else:
               xy = grab.identify_easy_sample(curr_crotch_img)
       time.sleep(1)
       u.motor_right(0.0)
       u.motor_left(0.0)
       break

def test_scan_easy():
    time.sleep(1)
    while not rospy.is_shutdown():
        coords = scan.check_easy_sample(scan_img_left, scan_img_right)
        rospy.loginfo("coords: " + str(coords))

def test_scan_precached():

    while not rospy.is_shutdown():
        coords = scan.check_precached(scan_img_left, scan_img_right)
        rospy.loginfo("coords: " + str(coords))

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
    mask_img = cv2.imread('mask.pbm')
    # move arm out of the way of the camera
    u.arm_target("X", 0)
    u.arm_target("Y", u.arm_max("Y"))
    while u.arm_should_be_moving("X") or u.arm_should_be_moving("Y"): pass
    time.sleep(1)
    if new_crotch_img2 is not None:
       curr_crotch_img = new_crotch_img2
     
       # Do the nasty, should apply mask to image.
       mask_img = cv2.resize(mask_img, (curr_crotch_img.shape[1], curr_crotch_img.shape[0]))
       #curr_crotch_img = np.concatenate((curr_crotch_img, mask_img), axis=1)
       #curr_crotch_img = Image.blend(curr_crotch_img, mask_img, 0.5)
       #curr_crotch_img = cv2.addWeighted(curr_crotch_img, 0.5, mask_img, 0.5, 0)
       curr_crotch_img = np.bitwise_and(curr_crotch_img, mask_img)
#---------------------------

       rospy.loginfo("image success")
       xy = grab.identify_easy_sample(curr_crotch_img)
       rospy.loginfo("coordinates: " + str(xy))
       if xy:
          rospy.loginfo("a sample has been detected")
          while xy is not None:
             grab.pick_up_at(u,xy)
             u.arm_target("X", 0)
             u.arm_target("Y", u.arm_max("Y"))
             while u.arm_should_be_moving("X") or u.arm_should_be_moving("Y"): pass
             xy = grab.identify_easy_sample(new_crotch_img2)
       else:
          rospy.loginfo("no sample detected")
    grab.place_sample(u,1)

def test_pickup_precached(u):
    
    u.motor_left(0.1)
    u.motor_right(0.1)
    time.sleep(3)

def test_scan_and_grab_easy(u):
   
    # move forward until scan cam sees sample 
    coords = test_forward_until_scanned(u, False)

    # turn so that the sample is in front of the rover
    turn_to_sample(u, coords, False)

    # move forward until the sample is seen by the pit cam, and park over it
    move_til_sample(u, False)

    # pick up sample
    test_pickup_easy(u)

def test_scan_and_grab_precached(u):
    coords = test_forward_until_scanned(u, True)

    turn_to_sample(u, coords, True)

    move_til_sample(u, True)

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

def test_identify_easy():
    while not rospy.is_shutdown():
       if new_crotch_img2 is not None:
          curr_crotch_img = new_crotch_img2
          xy = grab.identify_easy_sample(curr_crotch_img)
          rospy.loginfo("coordinates: " + str(xy))

def full_obj_rec_test(u):
    coords = test_forward_until_scanned_both(u)
    if coords[1]:
        rospy.loginfo("precached sample detected")
        turn_to_sample(u, coords, True)
        move_til_sample(u, True)
        test_pickup_precached(u)
    else:
        rospy.loginfo("easy sample detected")
        turn_to_sample(u, coords, False)
        move_til_sample(u, False)
        test_pickup_easy(u)


# toggleParam sets the node communication parameter to bool setting
def toggleParam(setting):
        rospy.set_param("/base_goal_param", setting)

# waifForToggle watches the parameter and waits for it to become true
def waitForToggle():
        control = rospy.get_param("/base_goal_param")
        while (control is False):
                time.sleep(0.1)
                try:
                        control = rospy.get_param("/base_goal_param")
                        if (control is True):
                                break
                except KeyError:
                        print 'waitForToggle: param was not set correctly'

def lv1retrieve():
    rospy.init_node('lv1retrieve', anonymous=False)
    rospy.loginfo('lv1retrieve node initialized')    
    
    rospy.Subscriber('crotch/image/image_raw', Image, handle_img)
    rospy.Subscriber('stereo/left/image_rect_color', Image, handle_scan_left)
    rospy.Subscriber('stereo/right/image_rect_color', Image, handle_scan_right)
    
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
    #test_identify_easy()
    #full_obj_rec_test(u)

    rospy.loginfo("Waiting to pick up easy sample")
    waitForToggle()
    rospy.loginfo("Picking up easy sample")
    test_scan_and_grab_easy(u)
    rospy.loginfo("Easy sample retrieved")
    toggleParam(False)
    rospy.loginfo("Waiting to pick up precached sample")
    waitForToggle()
    rospy.loginfo("Picking up precached sample")
    test_scan_and_grab_precached(u)
    rospy.loginfo("Precached sample retrieved")
    toggleParam(False)    


if __name__ == '__main__':
    try:
        lv1retrieve()
    except rospy.ROSInterruptException:
        pass
