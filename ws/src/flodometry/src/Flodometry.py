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
from wheel_encoders.msg import rpm

from filterpy.kalman import KalmanFilter

# Import config file
import sys, os
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
import config.kalman_config as cfg


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
        self.setup_kalman()
        # Subscribe to the adns topic 
        if __name__ == '__main__':
            self.setup_ros()
        

    def setup_ros(self):
        rospy.init_node('flodometry')
        rospy.Subscriber("/optical_flow", motion_read, self.update_flow)
        rospy.Subscriber("/encoder_values", rpm, self.update_encoders)
        # Initialize the publisher
        self.pub = rospy.Publisher("/odom", Odometry, queue_size=10)


    def setup_kalman(self):
        self.flow_x = KalmanFilter(dim_x=cfg.flow_x.dim_x, dim_z=cfg.flow_x.dim_z)
        self._setup_kalman(self.flow_x, cfg.flow_x)
        self.vel_left = KalmanFilter(dim_x=cfg.vel_left.dim_x, dim_z=cfg.vel_left.dim_z)
        self._setup_kalman(self.vel_left, cfg.vel_left)
        self.vel_right = KalmanFilter(dim_x=cfg.vel_right.dim_x, dim_z=cfg.vel_right.dim_z)
        self._setup_kalman(self.vel_right, cfg.vel_right)

    def _setup_kalman(self, kf, config):
        """Sets all of the kalman filter constants see config.kalman_config for 
            more details on each variable
        
        Returns:
            None
        """
        kf.x = config.x
        kf.F = config.F
        kf.H = config.H
        kf.P = config.P
        kf.Q = config.Q
        kf.R = config.R
        

    def update_flow(self, motion):
        """Call back to subscriber on /optical flow
        updates the Kalman filter with the velocity value then calls publish_updates
        
        Args:
            motion (motion_read): Message published to /optical_flow
        
        Returns:
            None
        """
        # Sensor was mounted so it only moved in the x direction during testing. 
        vel = motion.dx
        self.flow_x.predict()
        self.flow_x.update(vel)
        self.update()

    def update_encoders(self, enc):
        l_speed = enc.left_rpm
        self.vel_left.predict()
        self.vel_left.update(l_speed)
        r_speed = enc.right_rpm
        self.vel_right.predict()
        self.vel_right.update(r_speed)


    def update(self):
        """Publishes kalman filter data to odometry
        
        Args:
            x (List): List containing current state estimates
            p (List): List containing current variance estimates
        
        Returns:
            None
        """
        if __name__ == '__main__':
            x = self.flow_x.x
            p = self.flow_x.P
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
    rospy.spin()

