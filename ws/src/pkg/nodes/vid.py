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
import cv2

new_crotch_img2 = None
bridge = CvBridge()

TEST_PIT = True

def handle_img(img):
    global new_crotch_img2
    # convert ROS image message to numpy array for OpenCV
    try:
        new_crotch_img2 = bridge.imgmsg_to_cv2(img, "bgr8")
    except CvBridgeError as e:
        rospy.logerror(e)


def vid():
    rospy.init_node('vid', anonymous=False)
    rospy.loginfo('node initialized')    
    rospy.Subscriber('crotch/image/image_raw', Image, handle_img)
    rate = rospy.Rate(10)
    u = uniboard.Uniboard("/dev/ttyUSB1")
    u.arm_home()

    # MOVE FORWARD X meters
    u.motor_left(0.1)
    u.motor_right(0.1)
    time.sleep(9)
    u.motor_left(0)
    u.motor_right(0)
    
    # PICK UP SAMPLE
    if TEST_PIT:
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
    else:
       pick_up_center(u)
        
    # MOVE BACKWARD X meters
    u.motor_left(-0.1)
    u.motor_right(-0.1)
    time.sleep(8.9)
    u.motor_left(0)
    u.motor_right(0)    

if __name__ == '__main__':
    try:
        vid()
    except rospy.ROSInterruptException:
        pass
