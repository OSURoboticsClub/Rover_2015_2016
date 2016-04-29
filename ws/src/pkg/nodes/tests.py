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

print "Chris the king"

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
    while coords[0] > 40 or coords[0] < -40:
       if coords[0] > 0:
          rospy.loginfo("turn right")
          u.motor_left(0.22)
          u.motor_right(-0.22)
          time.sleep(1)
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
          time.sleep(1)
          u.motor_right(0.0)
          u.motor_left(0.0)
          if precached:
              coords = scan.check_precached(scan_img_left, scan_img_right)
          else:
              coords = scan.check_easy_sample(scan_img_left, scan_img_right)
       while coords is None:
          if precached:
              coords = scan.check_precached(scan_img_left, scan_img_right)
          else:
              coords = scan.check_easy_sample(scan_img_left, scan_img_right)

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

# moves forward until the pit cam sees the sample,
# then parks over it
def test_move_til_sample(u, precached):
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
           print "currently " + str(xy) 
       print "Im gunna grab now"
       time.sleep(0.5)
       u.motor_right(0.0)
       u.motor_left(0.0)
       break

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
    turn_to_sample(u, coords, False)
    #print "not turning"

    # move forward until the sample is seen by the pit cam, and park over it
    test_move_til_sample(u, False)

    # pick up sample
    test_pickup_easy(u)

def test_scan_and_grab_precached(u):
    coords = test_forward_until_scanned(u, True)

    turn_to_sample(u, coords, True)

    test_move_til_sample(u, True)

    test_pickup_precached(u)

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

    # test_forward_until_scanned_easy(u, False)
    #test_move_til_sample(u, False)
    #test_pickup_easy(u)
    test_scan_and_grab_easy(u)

    #test_pickup_precached(u)
    #test_scan_and_grab_precached(u)

if __name__ == '__main__':
    try:
        tests()
    except rospy.ROSInterruptException:
        pass
