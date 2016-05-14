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
import copy


import rospy
import tf
from flodometry.msg import motion_read
from nav_msgs.msg import Odometry
from wheel_encoders.msg import rpm

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
        self.setup_kalman()
        # Subscribe to the adns topic 
        if __name__ == '__main__':
            self.setup_ros()
        

    def setup_ros(self):
        self.tf_odom = tf.TransformBroadcaster()
        rospy.init_node('flodometry')
        rospy.Subscriber("/optical_flow", motion_read, self.update_flow)
        rospy.Subscriber("/encoder_values", rpm, self.update_encoders)
        # Initialize the publisher
        self.pub = rospy.Publisher("/odom", Odometry, queue_size=10)
        self.rate = rospy.Rate(60) # 60hz


    def setup_kalman(self):
        self.flow_x = KalmanFilter(dim_x=cfg.flow.dim_x, dim_z=cfg.flow.dim_z)
        self._setup_kalman(self.flow_x, cfg.flow)
        self.flow_y = KalmanFilter(dim_x=cfg.flow.dim_x, dim_z=cfg.flow.dim_z)
        self._setup_kalman(self.flow_y, cfg.flow)
        self.vel_left = KalmanFilter(dim_x=cfg.vel_left.dim_x, dim_z=cfg.vel_left.dim_z)
        self._setup_kalman(self.vel_left, cfg.vel_left)
        self.vel_right = KalmanFilter(dim_x=cfg.vel_right.dim_x, dim_z=cfg.vel_right.dim_z)
        self._setup_kalman(self.vel_right, cfg.vel_right)
        self.odometry = KalmanFilter(dim_x=cfg.odometry.dim_x, dim_z=cfg.odometry.dim_z)
        self._setup_kalman(self.odometry, cfg.odometry)

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
        self.flow_x.predict()
        self.flow_x.update(motion.dx)
        self.flow_y.update(motion.dy)
        

    def update_encoders(self, enc):
        l_speed = enc.left_rpm
        self.vel_left.predict()
        self.vel_left.update(l_speed)
        r_speed = enc.right_rpm
        self.vel_right.predict()
        self.vel_right.update(r_speed)


    def update(self):
        flow_x = self.flow_x.x[0]
        flow_y = self.flow_y.x[0]
        l_speed = self.vel_left.x[0]
        r_speed = self.vel_right.x[0]
        avg = float(l_speed+r_speed)/2
        diff = r_speed-avg
        # rospy.loginfo('left:{} right:{} avg:{} diff:{}'.format(l_speed, r_speed, avg, diff))
        H = cfg.odometry.get_h(theta=self.odometry.x[4])
        z = np.array([flow_x, flow_y, flow_x, 0.0])
        x1 = self.odometry.x
        # rospy.loginfo('Theta: {}, theta_dot: {}'.format(x1[4], x1[5]))
        self.odometry.predict()
        x2 = self.odometry.x
        # rospy.loginfo('Predicted Theta: {}, theta_dot: {}'.format(x2[4], x2[5]))
        self.odometry.update(z, H=H)
        x3 = self.odometry.x
        # rospy.loginfo('Updated Theta: {}, theta_dot: {}'.format(x3[4], x3[5]))


    def publish_updates(self):
        """Publishes kalman filter data to odometry
        
        Args:
            x (List): List containing current state estimates
            p (List): List containing current variance estimates
        
        Returns:
            None
        """
        if __name__ == '__main__':
            while not rospy.is_shutdown():
                odom = Odometry()
                odom.header.stamp = rospy.Time.now()
                odom.header.frame_id = '/odom'
                self.update()
                x = self.odometry.x
                odom.pose.pose.position.x = x[0]
                odom.pose.pose.position.y = x[2]
                # odom.pose.covariance[0] = p[0][0]
                odom.twist.twist.linear.x = x[1]
                odom.twist.twist.linear.y = x[3]
                odom.twist.twist.angular.z = x[5]
                # odom.twist.covariance[0] = p[1][1]
                odom.pose.pose.orientation.x
                # rospy.loginfo('[pos_x: {}, vel_x: {}, pos_y: {}, vel_y: {}, theta: {}, vel_theta: {}]'.format(*x))
                # quaternion_from_euler will operate on whatever object is passed 
                # to it, that is why I am passing a copy of x[4] because it was
                # changing it's value!
                quaternion = quaternion_from_euler(0.0, 0.0, copy.copy(x[4]))
                odom.pose.pose.orientation.x = quaternion[0]
                odom.pose.pose.orientation.y = quaternion[1]
                odom.pose.pose.orientation.z = quaternion[2]
                odom.pose.pose.orientation.w = quaternion[3]
                self.pub.publish(odom)
                self.tf_odom.sendTransform( 
                            (x[0], x[2], 0.0), 
                            (quaternion[0], quaternion[1], quaternion[2], quaternion[3]), 
                            odom.header.stamp, "base_link", "odom")
                self.rate.sleep()
        else:
            pass


if __name__ == '__main__':
    f = Flodometry()
    f.publish_updates()
    

