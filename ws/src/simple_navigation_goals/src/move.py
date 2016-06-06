#!/usr/bin/env python

from uniboard_communication.srv import *
import rospy
import tf
import math
import time
import numpy as np

from locate_home_base.srv import locate_base as locate
from imu.srv import zero
from nav_msgs.msg import Odometry 
from imu.msg import gyro

# global odom and gyro values
pos = 0.0
theta = 0.0
PI = 3.14159265
#stops = [(3.0 + 5.0/2.8, 3.0, -PI/2), (10.0/2.8, 10.0/2.8, PI/2)]

# level 1 stops, ignore orientation here
stops = [(6.0, 15.88, PI/2), (33.58, 16.29, 0), (16, 3, PI)]

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
    if angle < -0.02:
        u('motor_left', 2, '0.35', rospy.Time.now())
        u('motor_right', 2, '-0.35', rospy.Time.now())

        # theta should decrease here so we wait for theta - init to equal the angle, ie abs(.2) + abs(-.3) = abs(.5) 
        while (abs(theta) + abs(initialTheta) <= abs(angle)):
            time.sleep(.01)     
    elif angle > 0.02: 
        u('motor_left', 2, '-0.35', rospy.Time.now())
        u('motor_right', 2, '0.35', rospy.Time.now())
        
        # theta should increase here so we wait for theta - init to equal the angle, ie .4 - .1 = 3
        while (theta - initialTheta <= angle):
            pass
    else: 
        rospy.loginfo("ROTATION: angle within [-.02,.02] radians, skipping")
    # rot done, halt	
    u('motor_left', 2, '0.0', rospy.Time.now())
    u('motor_right', 2, '0.0', rospy.Time.now())
    rospy.loginfo("ROTATION: done, wheels off")	
	
""" move the rover forward from current position "distance" meters """
def moveRover(uniboard ,gyro, distance):
    initialPos = pos

    rospy.loginfo("MOVEMENT: attempting to move %s meters from x=%s", distance, pos)    
    # now we move in a straight line for h meters (while our moved distance minus starting point is less than desired)
    if (distance > .05):
    	u('motor_left', 2, '0.25', rospy.Time.now())
    	u('motor_right', 2, '0.25', rospy.Time.now())
    	while (abs(pos) - abs(initialPos) < abs(distance)):
        	pass
    else:
        rospy.loginfo("MOVEMENT: Too small of distance to move")  
    # met our distance, time to halt 
    u('motor_left', 2, '0.0', rospy.Time.now())
    u('motor_right', 2, '0.0', rospy.Time.now())          
    
    # sit, zero, sit
    time.sleep(1.0)
    gyro()
    time.sleep(1.0)

    rospy.loginfo("MOVEMENT: done, wheels off, gryo zeroed")   
 
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
        
        # yawAdjustment = np.arctan2(targetY, targetX)        
        # the yaw change is the difference between our current and goal
        # oriented away from the base station (our "0")
      
        # to aviod the "0"ing we do before a turn, the goal should take our 
        # target yaw and further adjust by current position
        # maybe this? 
        yawAdjustment = -curPos[2] + np.arctan2(targetY, targetX)
        
        # get h, the hypotenuse from the x,y goal we want to travel 
	h = math.sqrt(pow(targetX,2) + pow(targetY,2))
        rospy.loginfo("GOAL: x: %s, y: %s, yaw %s", goalPos[0], goalPos[1], goalPos[2])
        rospy.loginfo("ADJ POS w/ GOAL: x: %s, y: %s, yaw: %s, hypotenuse: %s",targetX, targetY, yawAdjustment, h) 
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

""" move the rover in small increments to and run home search in between """
def slowScanRotation(uniboard, a=-0.5, b=0.5, num=6):
   ''' Rotate slowly between relative angles a and b (rad), and
   stop at num spots.'''
   # rotate rover to the most negative angle 
   rotateRover(uniboard, a)
   # find increment to increase angle during each loop iteration
   theta = (b-a)/float(num)
   for i in range(num):
        # this should rotate the rover in the positive direction
        rotateRover(uniboard, theta)
        # look for checkerboard at new orientation
        (distance, angle) = getCurrentPosFromCheckboard(home)
        if distance > 0:
            rospy.loginfo("Detection")
            break
   return (distance, angle)

""" get the rovers offset from the checkboard on the home base """
def getCurrentPosFromCheckboard(home):
    try:
        # service is set to have a request data and return data field, our request just has the time it was sent
        response = home()
        base_distance = response.distance
        base_angle = response.angle

        rospy.loginfo("Distance: {}mm, angle: {}deg".format(base_distance, base_angle))
        base_distance = base_distance/1000/2.8
        base_angle = base_angle*PI/180
        
        if (base_distance == -12345): # "CANT_FIND" from the .h file
            rospy.logwarn("FIND CHECKERBOARD: Couldn't see checkerboard") 
            base_angle = -1;
            base_distance = -1
    except Exception as e:
        rospy.logwarn("FIND CHECKERBOARD: Failed to call service locate_base")
        rospy.logwarn("{}".format(e))
        base_angle = -1
        base_distance = -1
    rospy.loginfo("Distance: {}, angle: {}".format(base_distance, base_angle))
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
    rospy.wait_for_service('zero_gyro')
    u = rospy.ServiceProxy('uniboard_service', communication)
    z = rospy.ServiceProxy('zero_gyro', zero)
    rospy.wait_for_service('locate_base')
    home = rospy.ServiceProxy('locate_base', locate)
    rospy.Subscriber("/odom", Odometry, odomListener)
    rospy.Subscriber("/gyro", gyro, gyroListener)
    toggleParam(False)
    # loop over all goals
    for i in range(0, len(stops)):
        # get current pos
        curPos = getCurPos(listener)

        if (curPos[0] is not -1 and curPos[1] is not -1 and curPos[2] is not -1):
            # determine h distance to move and yaw angle to adjust 
            (h, yawAdjustment) = getYawAndH(curPos, stops[i], True)

            # actually move the rover
            rotateRover(u, yawAdjustment)
            moveRover(u, z, h)
            
            # transfer control
            if (i < 2):
            	toggleParam(True)
            	waitForToggle()
            
            # rather than rotate back to 0, add -curPos[2] into our yawAdj in rotate Rover
            # rotate back to initial orientation before next movement
            # curPos = getCurPos(listener)
            # rotateRover(u, -curPos[2])
        else:
            rospy.logwarn("MAIN: Current position lookup via TF failed, while setting movement")
    
    # last movement should be done via checkerboard
    # need to rotate first since we will likely come in at an angle and not have a good view...
 
    curPos = getCurPos(listener)
    
    # find where we are, -curPos would bring our angle back to 0, PI then rotates 180 back towards home base
    yawAdjustment = -curPos[2] + PI
    rotateRover(u, yawAdjustment)
    
    # look for the checkerboard
    (distance, angle) = getCurrentPosFromCheckboard(home)
    
    # if negative, we did not find it, need to rotate and try again
    if distance < 0: 
        rospy.loginfo("Initial checkerboard check failed, trying with rotation")   
        (distance, angle) = slowScanRotation(u)  
  
    rotateRover(u, -(angle))
    moveRover(u, z, (distance -.5))  	
    
    rospy.spin()  
