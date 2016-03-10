#!/usr/bin/env python

import rospy
import math
import numpy as np

# Bypass imports when runnning from test suite.
if __name__ == '__main__':
    from flodometry.msg import motion_read
    from nav_msgs.msg import Odometry
else:
    motion_read = object()
    Odometry = object()
    class Rospy(object):
        def Subscriber(self, *args, **kwargs):
            return object()
        def Publisher(self, *args, **kwargs):
            return object()
    rospy = Rospy()

    
from filterpy.kalman import KalmanFilter
from filterpy.common import Q_discrete_white_noise


class Flodometry(object):
    def __init__(self):
        self.setup_kalman()
        # Subscribe to the adns topic 
        rospy.Subscriber("/optical_flow", motion_read, self.update)
        # Initialize the publisher
        self.pub = rospy.Publisher("/odom", Odometry, queue_size=10)


    def setup_kalman(self):
        # Initialize Kalman filter with 2 state variables and one measurement
        self.kf = KalmanFilter(dim_x=2, dim_z=1)
        # Set initial position and velocity at 0
        self.kf.x = np.array([0.0, 0.0])
        # Set state transition with average dt of 0.1
        self.kf.F = np.array([[1, 0.1],
                        [0,  1]])  
        # Initialize the measurment transform with beta value from
        # file:///home/loren/Downloads/CTS12-37%20(1).pdf
        self.kf.H = np.array([[0.0, (1.0/0.035)]])
        # Set initial variance to 0 since state is known
        self.kf.P *= 0
        # Initialize process noise with variance of max vel and white noise and dt of 0.1
        self.kf.Q = Q_discrete_white_noise(dim=2, dt=0.1, var=0.2)
        

    def update(self, motion):
        # Sensor was mounted so it only moved in the x direction during testing. 
        vel = motion.dx
        # Set measurment accuaracy to 0.1 speed per 
        # file:///home/loren/Downloads/CTS12-37%20(1).pdf
        self.kf.R = np.array([[abs(0.1*vel)]])
        self.kf.predict()
        self.kf.update(vel)
        self.publish_updates(self.kf.x, self.kf.P)

    def publish_updates(self, x, p):
        odom = Odometry()
        odom.header.stamp = rospy.Time.now()
        odom.header.frame_id = '/odom'
        odom.pose.pose.position.x = x[0]
        odom.pose.covariance[0] = p[0][0]
        odom.twist.twist.linear.x = x[1]
        odom.twist.covariance[0] = p[1][1]
        self.pub.publish(odom)

if __name__ == '__main__':
    rospy.init_node('flodometry')
    f = Flodometry()
    rospy.spin()

