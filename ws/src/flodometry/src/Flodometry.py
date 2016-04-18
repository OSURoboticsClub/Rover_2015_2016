#!/usr/bin/env python
"""
Flodometry node for OSU Rover 2016
Currently subscribes to /optical_flow
and publishes filtered values to /odm

"""

import math
import numpy as np
from bunch import Bunch
from test_real_roving import TestRealRoving
import rospy
from flodometry.msg import motion_read
from nav_msgs.msg import Odometry
from encoders.msg import encoders

from filterpy.kalman import KalmanFilter
from tf.transformations import quaternion_from_euler

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
        rospy.init_node('flodometry')
        self.setup_kalman()
        # Subscribe to the adns topic 
        rospy.Subscriber("/optical_flow", motion_read, self.update)
        # Subscribe to the encoder topic
        rospy.Subscriber("/encoders", encoders, self.rupdate)
        # Initialize the publisher
        self.pub = rospy.Publisher("/odom", Odometry, queue_size=10)


    def setup_kalman(self):
        """Sets all of the kalman filter constants see config.kalman_config for 
            more details on each variable
        
        Returns:
            None
        """
        # Initialize all the kalman constants from config
        self.kf = KalmanFilter(dim_x=cfg.dim_x, dim_z=cfg.dim_z)
        self.kf.x = cfg.x
        self.kf.F = cfg.F
        self.kf.P = cfg.P
        self.kf.Q = cfg.Q
        self.kf.R = cfg.R
        # Initialize global class variables for encoder measurements and H
        self.enc_avg = 0.0
        self.enc_r = 0.0
        

    def update(self, motion):
        """Call back to subscriber on /optical flow
        updates the Kalman filter with the velocity value then calls publish_updates
        
        Args:
            motion (motion_read): Message published to /optical_flow
        
        Returns:
            None
        """
        # Sensor was mounted so it only moved in the x direction during testing. 
        vel_x = motion.dx
        vel_y = motion.dy
        self.kf.predict()
        H = cfg.H(self.kf.x[4])
        self.kf.update([vel_x, vel_y, self.enc_avg, self.enc_r], H=H)
        self.publish_updates()

    def rupdate(self, enc):
        # Wheel radius
        r = 0.13
        l_speed = enc.left*r
        r_speed = enc.right*r
        avg = float((l_speed+r_speed))/2
        # this will update our x position odometry with encoder data
        # self.kf.update(avg)
        v = r_speed-avg
        self.enc_avg = avg
        self.enc_r = v



    def publish_updates(self):
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
            x = self.kf.x
            odom.pose.pose.position.x = x[0]
            odom.pose.pose.position.y = x[2]
            # odom.pose.covariance[0] = p[0][0]
            odom.twist.twist.linear.x = x[1]
            odom.twist.twist.linear.y = x[3]
            odom.twist.twist.angular.z = x[5]
            # odom.twist.covariance[0] = p[1][1]
            odom.pose.pose.orientation.x
            quaternion = quaternion_from_euler(0.0, 0.0, x[4])
            odom.pose.pose.orientation.x = quaternion.x
            odom.pose.pose.orientation.y = quaternion.y
            odom.pose.pose.orientation.z = quaternion.z
            odom.pose.pose.orientation.w = quaternion.w
            self.pub.publish(odom)
        else:
            pass


if __name__ == '__main__':
    f = Flodometry()
    rospy.spin()

