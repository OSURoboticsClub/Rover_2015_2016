#!/usr/bin/env python
"""
Flodometry node for OSU Rover 2016
Currently subscribes to /optical_flow
and publishes filtered values to /odm
Attributes:
    CLOCK (Int): ADNS Clock rate
"""

import math
import numpy as np
from bunch import Bunch
from test_real_roving import TestRealRoving
import rospy
from flodometry.msg import motion_read
from nav_msgs.msg import Odometry

CLOCK = 4*10**6

from filterpy.kalman import KalmanFilter
from filterpy.common import Q_discrete_white_noise


class Flodometry(object):
    """Main class of Node flodometry
    
    Attributes:
        kf (KalmanFilter): A kalman filter to filter sensor values and estimate 
        odometry
        pub (rospy.Publisher): Publisher to push to odom
    """
    def __init__(self):
        """Initialize the node set up the Kalman filter and set up subscriber 
        and publisher.
        """
        rospy.init_node('flodometry')
        self.setup_kalman()
        # Subscribe to the adns topic 
        rospy.Subscriber("/optical_flow", motion_read, self.update)
        # Initialize the publisher
        self.pub = rospy.Publisher("/odom", Odometry, queue_size=10)


    def setup_kalman(self):
        """Sets all of the kalman filter constants
        
        Returns:
            None
        """
        # Initialize Kalman filter with 2 state variables and one measurement
        self.kf = KalmanFilter(dim_x=2, dim_z=1)
        # Set initial position and velocity at 0
        self.kf.x = np.array([0.0, 0.0])
        # Set state transition with average dt of 0.1
        self.kf.F = np.array([[1, 0.1],
                        [0,  1]])  
        # Initialize the measurment transform with beta value from
        # file:///home/loren/Downloads/CTS12-37%20(1).pdf
        self.kf.H = np.array([[0.0, 12188.48]])
        # Set initial variance to 0 since state is known
        self.kf.P *= 0
        # Initialize process noise with variance of max vel and white noise and dt of 0.1
        self.kf.Q = Q_discrete_white_noise(dim=2, dt=0.1, var=2)
        

    def update(self, motion):
        """Call back to subscriber on /optical flow
        updates the Kalman filter with the velocity value then calls publish_updates
        
        Args:
            motion (motion_read): Message published to /optical_flow
        
        Returns:
            None
        """
        # Sensor was mounted so it only moved in the x direction during testing. 
        dt = float(motion.shutter)/CLOCK
        vel = (motion.dx/dt)
        # Variance
        var = abs(vel - motion.dx/(dt-1.0/16.0))
        # Set measurment accuaracy to 0.1 speed per 
        # file:///home/loren/Downloads/CTS12-37%20(1).pdf
        self.kf.R = np.array([[var]])
        self.kf.predict()
        self.kf.update(vel)
        self.publish_updates(self.kf.x, self.kf.P)

    def publish_updates(self, x, p):
        """Publishes kalman filter data to odometry
        
        Args:
            x (List): List containing current state estimates
            p (List): List containing current variance estimates
        
        Returns:
            None
        """
        if __name__ == '__main__':
            odom = Odometry()
            odom.header.stamp = rospy.Time.now()
            odom.header.frame_id = '/odom'
            odom.pose.pose.position.x = x[0]
            odom.pose.covariance[0] = p[0][0]
            odom.twist.twist.linear.x = x[1]
            odom.twist.covariance[0] = p[1][1]
            self.pub.publish(odom)
        else:
            pass

if __name__ == '__main__':
    f = Flodometry()

