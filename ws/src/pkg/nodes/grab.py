#!/usr/bin/env python
import rospy
from std_msgs.msg import Bool
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import sys
sys.path.insert(0,'scripts')

import Color_Filter
import detector
import math
import cv2
from mechanical_arm.srv import *
sys.path.insert(0, "../../../../uniboard/roverlib")
from arm import Arm

MAX_TRIES = 10
ready = False
new_crotch_img = None
bridge = CvBridge()

# temporary, for testing
cv2.startWindowThread()
cv2.namedWindow('image')

def identify_precached(img):
    
    return detector.detect_precached(img)

def identify_easy_sample(img):
    
    # filter out purple object
    filtered = Color_Filter.filter_colors(frame=img, show_images=False, verbose = False)
 
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

        '''
        # coordinates in pixels where the center is (0,0)
        # assumes 1280x720 resolution
        xy = (centx-640,(centy * -1)+360)

        # convert pixels to mm
        # adjust these parameters as necessary
        h = 500 # height of camera from ground
        a = 60  # angle of view
        dx0 = h * math.tan(math.radians(a/2))
        x = (xy[0] * dx0) / (640)

        dy0 = (dx0 * 360) / (640)
        y = (dy0 * xy[1]) / (360)

        cv2.imshow('image', blurred)
        '''

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

def pick_up(xy):
    
    # this function uses the (x,y) coordinates from the crotch cam to 
    # adjust the arm's position if necessary, and then 
    # pick up the sample

    rospy.wait_for_service('move_arm')
    move_arm = rospy.ServiceProxy('move_arm', arm_position)
    #TODO: test and determine max arm params and account for them
    resp = move_arm(x,y,1)

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
        rospy.logerror(e)

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

    rate = rospy.Rate(10) # 10hz
    global ready

    while not rospy.is_shutdown():
        '''
        if ready: # will become true when nav sends the grab_signal
            grab_finished = False
            grab_succ = False
            num_tries = 0
    
            while grab_finished == False:
        
                rospy.loginfo("identifying sample")
                xy = identify_sample()
                if xy is None:
                    rospy.loginfo("sample could not be identified")
                    break
                rospy.loginfo("pick up attempt #{0}".format(num_tries))
                grab_succ = pick_up(xy)
                if (grab_succ) or (num_tries == MAX_TRIES):
                    grab_finished = True

            # logs result and publishes grab_succ on topic grab_success
            rospy.loginfo("grab success" if grab_succ else "grab failure")
            ready = False
            pub.publish(grab_succ)
        '''
        xy=identify_sample()
    	if xy is None:
            rospy.loginfo("sample could not be identified")
        else:
	    rospy.loginfo("coords: {0}".format(xy))
        rate.sleep()

def pick_up_at(xy, roverarm=None):
    if roverarm is None:
        roverarm = Arm()
    roverarm.home()
    roverarm.default()
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
    if xy[0] > X_CAM_MAX: 
        rospy.loginfo("the sample is too far right to pick up")
    elif xy[0] < X_CAM_MIN: 
        rospy.loginfo("the sample is too far left to pick up")
    elif xy[1] > Y_CAM_MAX: 
        rospy.loginfo("the sample is too far forward to pick up")
    elif xy[1] < Y_CAM_MIN: 
        rospy.loginfo("the sample is too far backward to pick up")
    else:
        x_sample = xy[0]-X_CAM_MIN
        y_sample = Y_CAM_MAX-(xy[1]-Y_CAM_MIN)

        # convert to meters
        # x_pick/x_arm_max = x_sample/x_cam_max
        x_pick = (x_sample/ACTUAL_CAM_LENGTH_X) * roverarm.ub.arm_max("X")
        y_pick = (y_sample/ACTUAL_CAM_LENGTH_Y) * roverarm.ub.arm_max("Y")
        # x_pick = (x_sample/ACTUAL_CAM_LENGTH_X) * u.arm_max("X")
        # y_pick = (y_sample/ACTUAL_CAM_LENGTH_Y) * u.arm_max("Y")


        # u.arm_target("X", x_pick) # HERE
        # u.arm_target("Y", y_pick) # HERE
        roverarm.move_XY(x_value=x_pick, y_value=y_pick)

        rospy.loginfo("calculated x: " + str(x_pick))
        rospy.loginfo("calculated y: " + str(y_pick))

        #x_pick += 0.07
        x_pick += 0.00
        y_pick -= 0.00

        # while u.arm_should_be_moving("X") or u.arm_should_be_moving("Y"): pass# HERE

        # z_safe_move(u, 0.2)# HERE
        # u.arm_z_wait_until_done()
        roverarm.move_Z_safe(value=0.2)
        # u.arm_target("A", 0.99)# HERE
        roverlib.open()

        
        # time.sleep(5) 
        # z_safe_move(u, 0.047)
        # u.arm_z_wait_until_done()# HERE
        roverarm.move_Z_safe(value=0.047)

        #u.arm_target("A", 0.5)
        #time.sleep(5)

        #u.arm_target("A", 1)
        #time.sleep(2)

        # u.arm_target("A", 0)# HERE
        # time.sleep(3)# HERE
        roverarm.close()

        # z_safe_move(u, 0.5)# HERE
        # u.arm_z_wait_until_done()# HERE
        roverarm.up()

if __name__ == '__main__':
    try:
        grab()
    except rospy.ROSInterruptException:
        pass
