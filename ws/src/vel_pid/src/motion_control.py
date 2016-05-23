#!/usr/bin/env python
import rospy
import time
import imp
import numpy as np

from bunch import Bunch

from uniboard_communication.srv import *
from nav_msgs.msg import Odometry
from geometry_msgs.msg import Twist
from flodometry.msg import vel_update

from pid import PID


class MotionControl(object):
    def __init__(self):
        rospy.on_shutdown(self.stop)
        rospy.wait_for_service('uniboard_service')
        self.uniboard_service = rospy.ServiceProxy('uniboard_service', communication)
        rospy.Subscriber("/cmd_vel", Twist, self.set_vel)
        rospy.Subscriber("/vel", vel_update, self.update)
        self.vel_pid = PID(self.drive, 0.5, 0.01, 0.0,[-2, 2], [-1, 1], 'vel_pid')
        self.rot_pid = PID(self.rotation, 0.5, 0.01, 0.0, [-2.0, 2.0], [-0.5, 0.5], 'rot_pid')
        # The offset value between wheel power to drive rotation
        self.rotation_offset = 0.0



    def drive(self, power):
        self.uniboard_service('motor_left', 3, str(power), rospy.Time.now())
        self.uniboard_service('motor_right', 3, str(power+self.rotation_offset), rospy.Time.now())

    def set_vel(self, twist):
        self.vel_pid.set_target(twist.linear.x)
        self.rot_pid.set_target(twist.angular.z)


    def rotation(self, diff):
        self.rotation_offset = diff

    def stop(self):
        self.vel_pid.stop()
        self.rot_pid.stop()


    def update(self, vel):
        linear = vel.linear_x
        angular = vel.angular_z
        self.vel_pid.update(linear)
        self.rot_pid.update(angular)


if __name__ == '__main__':
    rospy.init_node('vel_pid')
    controller = MotionControl()
    rospy.spin()

    
