#!/usr/bin/env python

import os
import sys
import math
import time

import cv2
import rospy
from std_msgs.msg import Bool
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

sys.path.insert(0, os.path.join(
                   os.path.dirname(__file__), 
                   'scripts'))
import Color_Filter
from detector import HaarDetector

sys.path.insert(0, os.path.join(
                   os.path.dirname(__file__), 
                   "../../../../uniboard/roverlib"))
from mechanical_arm.srv import *
from arm import Arm
import uniboard


MAX_TRIES = 10
ready = False
new_crotch_img = None
bridge = CvBridge()

# temporary, for testing
#cv2.startWindowThread()
#cv2.namedWindow('image')

def identify_precached(img):
    return HaarDetector.detect_precached(img)

def identify_easy_sample(img):
    
    # filter out purple object
    filtered = Color_Filter.filter_colors(frame=img, show_images=False, verbose=False)
 
    # detect edges of purple object
    edges = Color_Filter.contour_color(frame=filtered["Median Blur"][filtered["Colors"][0]], show_images=False)

    # blur creates consistency
    blurred = cv2.GaussianBlur(edges, (5,5), 0)
    
    # get image contours (hopefully only one, the purple sample)
    (cnts, _) = cv2.findContours(blurred.copy(), cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)

    if cnts:
        # take the biggest contour and calculate its centroid
        cont = max(cnts, key = cv2.contourArea)
        moments = cv2.moments(cont)
        centx = int(moments['m10']/moments['m00'])
        centy = int(moments['m01']/moments['m00'])

        # absolute coordinates where (0,0) is bottom left
        return (centx,(centy))

    else:
        return None
    

def identify_sample():
    
    # this function uses the crotch cam and recognition algorithms to 
    # determine if the object under the rover is indeed a sample
    # if it is a sample, it will determine the (x,y) coordinates
    
    coords = None
    curr_crotch_img = new_crotch_img
    if curr_crotch_img is not None:

        coords = identify_precached(curr_crotch_img)
        if coords is None:
            coords = identify_easy_sample(curr_crotch_img)

    # returns a tuple (x,y), or None if sample cannot be confirmed
    return coords

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
    
    rospy.loginfo('coords: ' + str(xy))

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
        y_pick -= 0.05

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
	z_safe_move(u, 0.03)
        u.arm_z_wait_until_done()

        u.arm_target("A", 0)
        time.sleep(3)

        z_safe_move(u, 0.5)
        u.arm_z_wait_until_done()

def place_sample(u, trayNum):
    # puts the sample in the holding area once it is picked up.

    # TODO: test these paramaters
    X_1 = 544
    X_2 = 761
    Y = u.arm_max('Y')

    u.arm_target('Y', Y)
    if trayNum == 1:
        u.arm_target('X', X_1)
    elif trayNum == 2:
        u.arm_target('X', X_2)
    else:
        rospy.logerr('invalid tray number')

    while u.arm_should_be_moving("X") or u.arm_should_be_moving("Y"): pass

    z_safe_move(u, 0.25)
    u.arm_z_wait_until_done()

    u.arm_target("A", .05)
    while u.arm_should_be_moving("A"):
        time.sleep(.1)
        u.arm_go("A", True)

    u.arm_target('A', 0.5)
    time.sleep(3)

    u.arm_target('A', 0)
    time.sleep(3)

    z_safe_move(u, 0.5)
    u.arm_z_wait_until_done()

    # move arm out of the way of the camera
    u.arm_target("X", 0)
    u.arm_target("Y", u.arm_max("Y"))
    while u.arm_should_be_moving("X") or u.arm_should_be_moving("Y"): pass
    time.sleep(1)

def pick_up(u,xy):
    
    # this function uses the (x,y) coordinates from the crotch cam to 
    # adjust the arm's position if necessary, and then 
    # pick up the sample

    pick_up_at(u,xy)
    # TODO: use both trays?
    place_sample(u, 1)

    # determine if grab was successful
    curr_crotch_img = new_crotch_img
    if identify_sample(new_crotch_img) is not None:
        return False

    return True

def handle_grab_signal(grab_signal):
    rospy.loginfo("grab signal received")
    global ready
    ready = True

def handle_img(img):
    global new_crotch_img    
    # convert ROS image message to numpy array for OpenCV
    try:
        new_crotch_img = bridge.imgmsg_to_cv2(img, "bgr8")
    except CvBridgeError as e:
        rospy.logerr(e)
    
def grab():
    # create publisher that pusblishes Bools to the grab_success topic
    # consumed by scan and nav
    pub = rospy.Publisher('grab_success', Bool, queue_size=10)
    
    # initialize node and name it grab
    rospy.init_node('grab', anonymous=False)
    rospy.loginfo("entered grab state")

    # grab subscribes to grab_signal topic (published by nav)
    rospy.Subscriber("grab_signal", Bool, handle_grab_signal)

    # crotch cam
    rospy.Subscriber('crotch/image/image_raw', Image, handle_img)
    
    while new_crotch_img is None:
        pass
    # once an image is received, starts a HaarDetector and
    # Color_Filter for sample detection
    Color_Filter.init(new_crotch_img)
    rospy.loginfo("Color Filter started")
    HaarDetector.initialize_precached()
    rospy.loginfo("Haar Detector started")
    rate = rospy.Rate(10) # 10hz
    global ready
    # TODO: we may need to use the uniboard_communication node instead
    u = uniboard.Uniboard("/dev/ttyUSB1")
    u.arm_home()
    while not rospy.is_shutdown():
        if ready: # will become true when nav sends the grab_signal
            grab_finished = False
            grab_succ = False
            num_tries = 0
    
            while grab_finished == False:
                rospy.loginfo("identifying sample")
                xy = identify_sample()
                rospy.loginfo("coords: {0}".format(xy))
                if xy is None:
                    rospy.loginfo("sample could not be identified")
                    break
#                rospy.loginfo("pick up attempt #{0}".format(num_tries))
#                grab_succ = pick_up(u,xy)
#                if (grab_succ) or (num_tries == MAX_TRIES):
#                    grab_finished = True

            # logs result and publishes grab_succ on topic grab_success
            rospy.loginfo("grab success" if grab_succ else "grab failure")
            ready = False
            pub.publish(grab_succ)
        
        rate.sleep()

if __name__ == '__main__':
    try:
        grab()
    except rospy.ROSInterruptException:
        pass
