#!/usr/bin/env python

import sys
import unittest
import rostest
from bunch import Bunch
import threading

import rospy
from uniboard_communication.srv import *
from uniboard_service import UniboardCommunication

PKG = 'test_uniboard_service'

class TestUniboardService(unittest.TestCase):
    def test_motor_left(self):
        rospy.wait_for_service('uniboard_service')
        self.uniboard_service = rospy.ServiceProxy('uniboard_service', communication)
        left = self.uniboard_service('motor_left', 1, str('0.1'), rospy.Time(secs=500))
        self.assertEquals(left.status, True)
        self.assertEquals(left.response, 'Success')
        self.assertEquals(left.data, '')


    def test_addToQueue(self):
        controller = UniboardCommunication()
        req = Bunch()
        req.priority = 1
        req.function = 'motor_left'
        req.data = "0.12"
        req.timestamp = rospy.Time(secs=500)
        t = threading.Thread(target=controller.addToQueue, args=(req,))
        t.daemon = True
        t.start()
        item = controller.get()
        self.assertEquals(item[1],controller.motor_left)
        self.assertEquals(item[2], req.data)
        self.assertEquals(item[3], req.timestamp)
        self.assertEquals(item[4], [])

if __name__ == '__main__':
    rostest.rosrun(PKG, 'test_uniboard_service', TestUniboardService)