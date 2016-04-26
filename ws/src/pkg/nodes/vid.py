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

def z_safe_move(u, z):
	"""Z values from .5 to 0, with .5 being upright."""
	z = .5 - z
	if u.arm_current("X", 0) > u.arm_max("X")/2:
        	u.arm_target("Z", .5+z)
	else:
		u.arm_target("Z", .5-z)

def pick_up_at(u,xy):

    # constants that define the range of the arm
    # from the pit cam's perspective
    X_CAM_MAX = 870.0
    X_CAM_MIN = 435.0
    Y_CAM_MAX = 383.0
    Y_CAM_MIN = 119.0

    REAL_X = 0.29
    REAL_Y = 0.24

    ACTUAL_CAM_LENGTH_X = X_CAM_MAX-X_CAM_MIN
    ACTUAL_CAM_LENGTH_Y = Y_CAM_MAX-Y_CAM_MIN
    
    # assumes camera is oriented so that (0,0)
    # of the camera corresponds to (0,0) of the arm
    if xy[0] > X_CAM_MAX: rospy.loginfo("the sample is too far left to pick up")
    elif xy[0] < X_CAM_MIN: rospy.loginfo("the sample is too far right to pick up")
    elif xy[1] > Y_CAM_MAX: rospy.loginfo("the sample is too far forward to pick up")
    elif xy[1] < Y_CAM_MIN: rospy.loginfo("the sample is too far backward to pick up")
    else:
        x_sample = xy[0]-X_CAM_MIN
        y_sample = Y_CAM_MAX-(xy[1]-Y_CAM_MIN)

        # convert to meters
        # x_pick/x_arm_max = x_sample/x_cam_max
        x_pick = (x_sample/ACTUAL_CAM_LENGTH_X) * u.arm_max("X")
        y_pick = (y_sample/ACTUAL_CAM_LENGTH_Y) * u.arm_max("Y")

        x_pick += 0.0
        y_pick -= 0.125

        u.arm_target("X", x_pick)
        u.arm_target("Y", y_pick)

        rospy.loginfo("calculated x: " + str(x_pick))
        rospy.loginfo("calculated y: " + str(y_pick))

        while u.arm_should_be_moving("X") or u.arm_should_be_moving("Y"): pass

        z_safe_move(u, 0.2)
        u.arm_z_wait_until_done()

        u.arm_target("A", .05)
	while u.arm_should_be_moving("A"):
	    time.sleep(.1)
	    u.arm_go("A", True)

        u.arm_target("A", 0.99)
        time.sleep(3) 
	z_safe_move(u, 0.04)
        u.arm_z_wait_until_done()

        u.arm_target("A", 0)
        time.sleep(3)

        z_safe_move(u, 0.5)
        u.arm_z_wait_until_done()

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
             pick_up_at(u,xy)
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
