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
    # TODO: measure these
    X_CAM_MAX = 800.0
    X_CAM_MIN = 439.0
    Y_CAM_MAX = 425.0
    Y_CAM_MIN = 61.0

    REAL_X = 0.29
    REAL_Y = 0.24

    ACTUAL_CAM_LENGTH_X = X_CAM_MAX-X_CAM_MIN
    ACTUAL_CAM_LENGTH_Y = Y_CAM_MAX-Y_CAM_MIN
    
    # assumes camera is oriented so that (0,0)
    # of the camera corresponds to (0,0) of the arm
    if xy[0] > X_CAM_MAX: rospy.loginfo("the sample is too far right to pick up")
    elif xy[0] < X_CAM_MIN: rospy.loginfo("the sample is too far left to pick up")
    elif xy[1] > Y_CAM_MAX: rospy.loginfo("the sample is too far forward to pick up")
    elif xy[1] < Y_CAM_MIN: rospy.loginfo("the sample is too far backward to pick up")
    else:
        x_sample = xy[0]-X_CAM_MIN
        y_sample = Y_CAM_MAX-(xy[1]-Y_CAM_MIN)

        # convert to meters
        # x_pick/x_arm_max = x_sample/x_cam_max
        x_pick = (x_sample/ACTUAL_CAM_LENGTH_X) * u.arm_max("X")
        y_pick = (y_sample/ACTUAL_CAM_LENGTH_Y) * u.arm_max("Y")

        u.arm_target("X", x_pick)
        u.arm_target("Y", y_pick)

        rospy.loginfo("calculated x: " + str(x_pick))
        rospy.loginfo("calculated y: " + str(y_pick))

        #x_pick -= 0.2
        y_pick -= 0.03

        while u.arm_should_be_moving("X") or u.arm_should_be_moving("Y"): pass

        z_safe_move(u, 0.2)
        u.arm_z_wait_until_done()

        u.arm_target("A", 0.99)
        time.sleep(5) 
	z_safe_move(u, 0)
        u.arm_z_wait_until_done()

        u.arm_target("A", 0.5)
        time.sleep(5)

        u.arm_target("A", 1)
        time.sleep(2)

        u.arm_target("A", 0)
        time.sleep(3)

        z_safe_move(u, 0.5)
        u.arm_z_wait_until_done()

def test_scan_and_grab(u):
    
    coords = None
    rate = rospy.Rate(10)

    # MOVE FORWARD until sample is seen
    u.motor_right(0.1)
    u.motor_left(0.1)
    while coords is None: 
       coords = scan_for_easy_samples(scan_img_left, scan_img_right)
       rate.sleep()
    # record current speed of wheels
    lrpm = u.encoder_left_rpm()
    rrpm = u.encoder_right_rpm()
    u.motor_left(0.0)
    u.motor_right(0.0)
    rospy.loginfo("coords: " + str(coords))

    # 98.6 cm circumfrence for wheels assumed
    rpm = (lrpm + rrpm) / 2.0
    rospy.loginfo("rpm: " + str(rpm))
    circum = 986
    mmpers = rpm * circum / 60
    rospy.loginfo("m/s: " + str(mmpers))
    
    time_forward = coords[2] / mmpers
    rospy.loginfo("time forward: " + str(time_forward))

    # go forward that much
    u.motor_left(0.1)
    u.motor_right(0.1)
    time.sleep(time_forward)
    u.motor_left(0.0)
    u.motor_right(0.0)

    # PICK UP SAMPLE
    # only used for pit camera tests
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
