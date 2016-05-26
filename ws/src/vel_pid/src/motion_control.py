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
        self.vel_pid.start()
        self.rot_pid = PID(self.rotation, 0.5, 0.01, 0.0, [-2.0, 2.0], [-0.5, 0.5], 'rot_pid')
        self.rot_pid.start()
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

    def start(self):
        self.vel_pid.start()
        self.vel_pid.reset()
        self.rot_pid.start()
        self.rot_pid.reset()

    def update(self, vel):
        linear = vel.linear_x
        angular = vel.angular_z
        self.vel_pid.update(linear)
        self.rot_pid.update(angular)

# waifForToggle watches the node transition parameter (base_goal_param)
# False: Starting state, a goal has not yet been met and PID should be running
# True: A goal has been met, the navigaiton and PID code should halt
def runPID():
        param = rospy.get_param("/base_goal_param")
        i = 0
        while (param is False):
                # init and run controller
                if (i == 0):
                    print 'init controller'
                    controller = MotionControl();
       
                # parameter is false, we are still running
                print 'running'

                # check often, this may actually need to be sped up to not interfere with other teams code 
                time.sleep(0.5)
                
                i += 1
                # wait for toggle
                try:
                        param = rospy.get_param("/base_goal_param")
                        if (param is True):
                                # parameter is true, time to stop movement and wait again
                                print 'stopping'
                                controller.stop()
                                break
                except KeyError:
                        print 'waitForToggle: param was not set correctly'

def waitToRun():
    param = rospy.get_param("/base_goal_param")
    while (param is True):
         # check often, this may actually need to be sped up to not interfere with other teams code 
         time.sleep(0.5)
         print 'halted'
         # wait for toggle
         try:
             param = rospy.get_param("/base_goal_param")
             if (param is False):
                 # parameter is false, time to continue
                 print 'resuming'
                 break
         except KeyError:
             print 'waitForToggle: param was not set correctly'

if __name__ == '__main__':
    rospy.init_node('vel_pid')
    # 2 stops means we toggle twice, need to init PID stops+1 times
    runPID()
    waitToRun()
    runPID()
    waiToRun()
    runPID()
    rospy.spin()

    
