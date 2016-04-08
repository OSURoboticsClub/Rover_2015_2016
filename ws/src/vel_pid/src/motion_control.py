#!/usr/bin/env python
import rospy
import time
import imp

from bunch import Bunch

from uniboard_communication.srv import *
from nav_msgs.msg import Odometry
from vel_pid.msg import vel_pid_status
from vel_pid.srv import set_target

from pid import PID

STEP_LIMIT = 0.01



class MotionControl(object):
    def __init__(self):
        rospy.on_shutdown(self.stop)
        rospy.wait_for_service('uniboard_service')
        self.uniboard_service = rospy.ServiceProxy('uniboard_service', communication)
        self.sub = rospy.Subscriber('/odom', Odometry, self.update)
        
        self.vel_pid = PID(self.drive, 0.5, 0.01, 0.0,[-2, 2], [-1, 1], 'vel_pid')

        self.pos_pid = PID(self.set_vel, 3.0, 0, 0,[-5.0, 5.0], [-1.0, 1.0], 'pos_pid')


    def advertise_service(self):
        self.s = rospy.Service('set_motion_goal', 
                            set_target, 
                            self.motion_goal)
        

    def drive(self, power):
        self.uniboard_service('motor_left', 3, str(power), rospy.Time.now())
        self.uniboard_service('motor_right', 3, str(power), rospy.Time.now())

    def set_vel(self, vel):
        return self.vel_pid.set_target(vel)

    def motion_goal(self, target):
        return self.pos_pid.set_target(target.target)

    def stop(self):
        self.vel_pid.stop()
        self.pos_pid.stop()


    def update(self, odom):
        pos = odom.pose.pose.position.x
        vel = odom.twist.twist.linear.x
        self.pos_pid.update(pos)
        self.vel_pid.update(vel)

if __name__ == '__main__':
    rospy.init_node('vel_pid')
    controller = MotionControl()
    controller.advertise_service()
    rospy.spin()

    
