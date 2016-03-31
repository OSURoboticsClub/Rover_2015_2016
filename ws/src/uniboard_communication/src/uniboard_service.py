#!/usr/bin/env python

import rospy
import Queue
import imp
# Importing the uniboard api
uniboard = imp.load_source('uniboard', 
    '/home/loren/dev/Rover2016/uniboard/roverlib/uniboard.py')
from uniboard_communication.srv import *
#Fake uniboard
import fake_uniboard

BOARD = "/dev/ttyUSB2"

class UniboardCommunication(Queue.PriorityQueue):
    """
    Handles all communciation with the uniboard for 2016 mars rover
    access functions through ros services never call directly.
    """
    def __init__(self, maxsize=10):
        Queue.PriorityQueue.__init__(self)
        self.functions = dict(
                        motor_left = self.motor_left,
                        motor_right = self.motor_right)
    

    def setup_board(self, board):
        try:
            self.board = uniboard.Uniboard(board)
            rospy.loginfo('Using real uniboard')
        except:
            self.board = fake_uniboard.Uniboard(board)
            rospy.logwarn('Using Fake Uniboard')


    def setup_ros(self):
        self.s = rospy.Service('uniboard_service', 
                            communication, 
                            self.addToQueue)


    def motor_left(self, power):
        p = float(power)
        self.board.motor_left(p)
        return [True, 'Success', '']

    def motor_right(self, power):
        p = float(power)
        self.board.motor_right(p)
        return [True, 'Success', '']


    def addToQueue(self, req):
        if self.full():
            return [False, 'queue_full', None]
        else:
            if req.function not in self.functions.keys():
                return [False, 'Function not implemented', '']
            else:
                resp = []
                self.put((req.priority, 
                        self.functions[req.function],
                        req.data, 
                        req.timestamp, 
                        resp))
                self.join()
                return resp
                
                

    def worker(self):
        while not rospy.is_shutdown():
            if not self.empty():
                item = self.get()
                resp = item[1](item[2])
                item[4].extend(resp)
                self.task_done()
                

if __name__ == '__main__':
    # Initialize the node
    rospy.init_node('uniboard_communication')
    controller = UniboardCommunication()
    controller.setup_board(BOARD)
    controller.setup_ros()
    controller.worker()
    rospy.spin()