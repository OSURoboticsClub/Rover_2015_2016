#!/usr/bin/env python

from uniboard_communication.srv import *
import rospy
import tf
import math
import time

from nav_msgs.msg import Odometry 
from imu.msg import gyro

# global odom and gyro values
pos = 0.0
theta = 0.0
PI = 3.14159265

stops = [(7.0, 3.0,0.0), (33.58, 16.29, 0), (16, 3, PI)]
#stops = [(6.0, 15.88, PI/2), (33.58, 16.29, 0), (16, 3, PI)]

""" listener updates the x position for the rover at all times
pos is watched in the move function to control distance """
def odomListener(odom):
    global pos
    pos = odom.pose.pose.position.x

def gyroListener(rotation):
    global theta
    theta = rotation.theta

""" first moves the rover to correct the orientation """
def rotateRover(uniboard, angle):
    initialTheta = theta

    # if the angle is less than 0, we are oriented above the x axis, so we need to turn favoring the left side
    rospy.loginfo("ROTATION: attempting to adjust the rover %s radians", angle)
    if angle < 0:
	# let initial = 1
        # theta should decrease here so we wait for theta - init to equal the angle, ie .6 - 1 = -4. 
	while (theta - initialTheta <= angle):
    	    u('motor_left', 2, '0.22', rospy.Time.now())
            u('motor_right', 2, '-0.22', rospy.Time.now())
    elif angle > 0: 
        # theta should increase here so we wait for theta - init to equal the angle, ie 1.4 - 1 = 4
	while (theta - initialTheta <= angle):
            u('motor_left', 2, '-0.22', rospy.Time.now())
            u('motor_right', 2, '0.22', rospy.Time.now())
    else: 
	rospy.loginfo("ROTATION: 0.0 angle, skipping")
    # rot done, halt	
    u('motor_left', 2, '0.0', rospy.Time.now())
    u('motor_right', 2, '0.0', rospy.Time.now())
    rospy.loginfo("ROTATION: done, wheels off")	
	
""" move the rover forward from current position "distance" meters """
def moveRover(uniboard, distance):
    initialPos = pos

    rospy.loginfo("MOVEMENT: attempting to move %s meters from x=%s", distance, pos)    
    # now we move in a straight line for h meters (while our moved distance minus starting point is less than desired)
    while (pos - initialPos < distance):
        u('motor_left', 2, '0.25', rospy.Time.now())
        u('motor_right', 2, '0.25', rospy.Time.now())

    # met out distance, time to halt 
    u('motor_left', 2, '0.0', rospy.Time.now())
    u('motor_right', 2, '0.0', rospy.Time.now())             
    rospy.loginfo("MOVEMENT: done, wheels off")   
 
""" Finds the h value we should move (hypotenuse of our pos to the x,y goal
also finds the yaw differentce between our pos and the pos needed to exicute the goal
TODO: make this yaw calculation make sense (positive means: move how... etc)
"""
def getYawAndH(curPos, goalPos, globalFlag):
	# convert global position to relitive position for sending goals
        if globalFlag is True:
            targetX = goalPos[0] - curPos[0]
	    targetY = goalPos[1] - curPos[1]
        # no conversion needed since goal is with respect to rover
        else: 
            targetX = goalPos[0]
            targetY = goalPos[1]

        # the yaw change is the difference between our current and goal
        # need to know which dir to turn, this may need to change 
        yawAdjustment = goalPos[2] - curPos[2] 
        
        # get h, the hypotenuse from the x,y goal we want to travel 
	h = math.sqrt(pow(targetX,2) + pow(targetY,2))
        rospy.loginfo("GOAL: x: %s, y: %s, yaw %s", goalPos[0], goalPos[1], goalPos[2])
        rospy.loginfo("ADJUSTED POSITION: x: %s, y: %s, yaw: %s, hypotenuse: %s",targetX, targetY, yawAdjustment, h) 
        return (h, yawAdjustment)

""" Looks up the current x, y and yaw of the rover via TF 
-1s returned if the lookup fails"""
def getCurPos(listener):
    # lookup the transform 
    try:
    	listener.waitForTransform("/map","/base_link",rospy.Time(),rospy.Duration(5.0)) 
    	(position, quaternion) = listener.lookupTransform("/map","/base_link", rospy.Time(0))
    	x = position[0]
    	y = position[1]
        #  convert quat to euler
     	euler = tf.transformations.euler_from_quaternion(quaternion)
     	yaw = euler[2]
    except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
    	rospy.logwarn("TRANSFORM_LISTENER: Exception")
    	x = -1
    	y = -1
    	yaw = -1
     
    rospy.loginfo("CURRENT POSITION: x: %s, y: %s, yaw: %s", x, y, yaw)
    return (x, y, yaw)

""" get the rovers offset from the checkboard on the home base """
def getCurrentPosFromCheckboard():
    rospy.wait_for_service('locate_base')
    try:
        rospy.ServiceProxy('locate_base',locate_base)
        # service is set to have a request data and return data field, our request just has the time it was sent
        response = locate_base(rospy.Time(0))
        base_angle = response.distance
        base_distance = response.angle

        if (base_distance == -12345): # "CANT_FIND" from the .h file
            rospy.logwarn("FIND CHECKERBOARD: Couldn't see checkerboard")
            base_angle = -1;
            base_distance = -1
    except:
        rospy.logwarn("FIND CHECKERBOARD: Failed to call service locate_base")
        base_angle = -1
        base_distance = -1

    return (base_distance, base_angle)

# TODO: NOW THAT WE ARE ALL IN PYTHON WE CAN DROP PARAM AND COMBINE INTO ONE FILE IF WE WANT
""" toggleParam sets the node communication parameter to bool setting """
def toggleParam(setting):
        rospy.set_param("/base_goal_param", setting)

""" waifForToggle watches the parameter and waits for it to become true """
def waitForToggle():
        control = rospy.get_param("/base_goal_param")
        while (control is True):
                time.sleep(0.5)
                try:
                        control = rospy.get_param("/base_goal_param")
                        if (control is False):
                                break
                except KeyError:
                        print 'waitForToggle: param was not set correctly'

if __name__ == '__main__':
    rospy.init_node("move_rover")
    listener = tf.TransformListener()
    rospy.wait_for_service('uniboard_service')
    u = rospy.ServiceProxy('uniboard_service', communication)
    
    rospy.Subscriber("/odom", Odometry, odomListener)
    rospy.Subscriber("/gyro", gyro, gyroListener)

    # loop over all goals
    for i in range(0, len(stops)):
        # get current pos
        curPos = getCurPos(listener)

        if (curPos[0] is not -1 and curPos[1] is not -1 and curPos[2] is not -1):
            # determine h distance to move and yaw angle to adjust 
            (h, yawAdjustment) = getYawAndH(curPos, stops[i], True)

            # actually move the rover
            rotateRover(u, yawAdjustment)
            moveRover(u, h)
            # transfer control
            toggleParam(True)
            waitForToggle()
        else:
            rospy.logwarn("MAIN: Current position lookup via TF failed, rover has no plan of movement now")
    
    # last movement should be done via checkerboard
    # need to rotate first since we will likely come in at an angle and not have a good view...
 
    # TODO: NEEDS LEGIT VALUE TO SET US UP FOR CHECKBOARD DETECTION. MAYBE PI/4?
    yawAdjustment = PI
    rotateRover(u, yawAdjustment)
    
    # once rotation done, find checkerboard
    (distance, angle) = getCurrentPosFromCheckboard()
    if (distance is not -1 and angle is not -1):
    	# TODO: DOES THIS ANGLE MAKE SENSE SINCE WE ARE NOW TURNED AORUND ROUGHLY PI RADS?
    	rotateRover(u, angle)
    	moveRover(u, distance)  	
    else:
        rospy.logward("MAIN: Checkboard detection failed, rover has no plan of movment now")
    rospy.spin()  
