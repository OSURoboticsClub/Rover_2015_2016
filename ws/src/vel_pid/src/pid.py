#!/usr/bin/env python
import rospy
import time

from uniboard_communication.srv import *
from vel_pid.msg import pid_status
STEP_LIMIT = 0.01

class PID(object):
    def __init__(self, outFun, kP, kI, kD, inRange, outRange, name):
        self.pub = rospy.Publisher(name+'_status', pid_status, queue_size=10)
        self.outFun = outFun
        self.kP = kP
        self.kI = kI
        self.kD = kD
        self.inRange = inRange
        self.outRange = outRange
        # Assuming we are being updated at a constant or near constant rate
        self.err = []
        self.target = 0
        self.out = 0


    def update(self, current):
        err = self.target - current
        self.err.append(float(err))
        P = err*self.kP
        x = len(self.err)
        if x > 1:
            i = sum(self.err)
            d = self.err[x-1]-self.err[x-2]
        else:
            i = 0
            d = 0
        I = self.kI*i
        D = self.kD*d
        out = P+I+D
        # Scaling output to out range
        # out = u*(float(self.outRange[1])/self.inRange[1])
        if out > self.outRange[1]:
            out = self.outRange[1]
        elif out < self.outRange[0]:
            out = self.self.outRange[0]
        self.out = out
        self.outFun(out)
        self.publish_status(current, [P, I, D])


    def integrate(self, f, x):
        i = 0
        for n in range(len(f) - 1):
            i += f[n]*(x[n+1]-x[n])
        return i


    def publish_status(self, curr, pid_terms):
        status = pid_status()
        status.status = "Running"
        status.out = self.out
        status.target = self.target
        status.current = curr
        self.pid_terms = pid_terms
        self.pub.publish(status)


    def set_target(self, target):
        if target.target <= self.outRange[1] and target.target >= self.outRange[0]:
            if self.target == target.target:
                return True
            else:
                self.err = []
                return True
        else:
            return False
            rospy.logwarn('Target set is out of input range')