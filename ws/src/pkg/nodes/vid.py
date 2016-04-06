#!/usr/bin/env python
import rospy
import grab
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import time
import sys
sys.path.insert(0, "../../../../uniboard/roverlib")
import uniboard

new_crotch_img2 = None
bridge = CvBridge()

TEST_PIT = False

def handle_img(img):
    global new_crotch_img2
    # convert ROS image message to numpy array for OpenCV
    try:
        new_crotch_img2 = bridge.imgmsg_to_cv2(img, "bgr8")
    except CvBridgeError as e:
        rospy.logerror(e)

def pick_up_center(u):

    u.arm_target("Y", u.arm_max("Y")/2) # move to center
    u.arm_target("X", u.arm_max("X")/2) # move to center

    while u.arm_should_be_moving("X") or u.arm_should_be_moving("Y"): pass

    u.arm_target("Z", 0.2)
    u.arm_z_wait_until_done()

    u.arm_target("A", 1)
    while u.arm_should_be_moving("A"): pass

    u.arm_target("Z", 0)
    u.arm_z_wait_until_done()

    u.arm_target("A", 0)
    while u.arm_should_be_moving("A"): pass

    u.arm_target("Z", 0.5)
    u.arm_z_wait_until_done()

def drop(u):

   u.arm_target("Z", 0)
   u.arm_z_wait_until_done()

   u.arm_target("A", 1)
   while u.arm_should_be_moving("A"): pass

   u.arm_target("Z", 0.2)
   u.arm_z_wait_until_done()

   u.arm_target("A", 0)
   while u.arm_should_be_moving("A"): pass

   u.arm_target("Z", 0.5)
   u.arm_z_wait_until_done()

def vid():
    rospy.init_node('vid', anonymous=False)
    rospy.loginfo('node initialized')    
    rospy.Subscriber('crotch/image/image_raw', Image, handle_img)
    rate = rospy.Rate(10)
    u = uniboard.Uniboard("/dev/ttyUSB1")
    u.arm_home()

    # MOVE FORWARD X meters
    u.motor_left(0.25)
    u.motor_right(0.25)
    time.sleep(5)
    u.motor_left(0)
    u.motor_right(0)

    # PICK UP SAMPLE
    if TEST_PIT:
       # only used for pit camera tests
       if new_crotch_img2 is not None:
          curr_crotch_img = new_crotch_img2
          xy = grab.identify_easy_sample(curr_crotch_img)
          rospy.loginfo(xy)
          pick_up_at(u,xy)
    else:
       pick_up_center(u)
        
    # MOVE BACKWARD X meters
    u.motor_left(-0.25)
    u.motor_right(-0.25)
    time.sleep(5)
    u.motor_left(0)
    u.motor_right(0)    

    # DROP SAMPLE
    drop(u)

if __name__ == '__main__':
    try:
        vid()
    except rospy.ROSInterruptException:
        pass
