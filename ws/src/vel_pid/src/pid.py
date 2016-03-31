#!/usr/bin/env python
import rospy
import time
import imp
from scipy.integrate import quad

from uniboard_communication.srv import *
from nav_msgs.msg import Odometry
from vel_pid.msg import vel_pid_status
from vel_pid.srv import set_target

STEP_LIMIT = 0.1



class PID(object):
    def __init__(self):
        rospy.wait_for_service('uniboard_service')
        self.uniboard_service = rospy.ServiceProxy('uniboard_service', communication)
        self.pub = rospy.Publisher('pid_status', vel_pid_status, queue_size=10)
        self.sub = rospy.Subscriber('/odom', Odometry, self.update)
        self.s = rospy.Service('set_vel_pid_target', 
                            set_target, 
                            self.set_target)
        self.target = 0
        self.err = ([], [])
        self.MAXVEL = 2
        self.MINVEL = -2
        self.MAXOUT = 1
        self.MINOUT = -1
        self.kP = 1
        self.kD = 0.2
        self.kI = 0.5
        self.out = 0


    def update(self, odom):
        time = odom.header.stamp
        vel = odom.twist.twist.linear.x
        err = float(self.target) - vel
        self.err[0].append(float(err))
        self.err[1].append(float(time.nsecs)/(10**9))
        P = err*self.kP
        x = len(self.err[0])
        if x > 1:
            i = self.integrate(*self.err)
            d = ((self.err[0][x-1]-self.err[0][x-2])/
                (self.err[1][x-1]-self.err[1][x-2]))
        else:
            i = 0
            d = 0
        I = self.kI*i
        D = self.kD*d
        u = P+I+D
        out = u*(float(self.MAXOUT)/self.MAXVEL)
        if out > 1:
            out = 1
        elif out < -1:
            out = -1
        if out-self.out > STEP_LIMIT:
            self.out += STEP_LIMIT
        elif out-self.out < -STEP_LIMIT:
            self.out -= STEP_LIMIT
        else:
            self.out = out  

        left = self.uniboard_service('motor_left', 3, str(self.out), rospy.Time.now())
        left = self.uniboard_service('motor_right', 3, str(self.out), rospy.Time.now())
        status = vel_pid_status()
        status.status = "Running"
        status.out = self.out
        status.target = self.target
        status.vel = vel
        self.pub.publish(status)


    def integrate(self, f, x):
        i = 0
        for n in range(len(f) - 1):
            i += f[n]*(x[n+1]-x[n])
        return i




    def set_target(self, target):
        self.target = target.target
        self.err = ([],[])
        return True


    def tune(self):
        pass

if __name__ == '__main__':
    rospy.init_node('vel_pid')
    pid = PID()
    rospy.spin()

    
