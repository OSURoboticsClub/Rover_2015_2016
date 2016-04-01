#!/usr/bin/env python
"""uniboard_communication node for OSU Mars Rover 2016

Attributes:
    BOARD (str): usb location of board
    uniboard (TYPE): uniboard module
"""

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
    Main class of uniboard_communication node, implements a priority queue for 
    single threaded communication with the uniboard. 
    Handles all communciation with the uniboard for 2016 mars rover
    access functions through ros services never call directly.
    
    Attributes:
        board (uniboard.Uniboard): Object encapsulating the uniboard api
        functions (List): List of available functions to be called 
        s (rospy.Service): advertised service object
    """
    def __init__(self, maxsize=10):
        """
        Initialize the node, and functions list
        Args:
            maxsize (int, optional): Maxsize of queue
        """
        Queue.PriorityQueue.__init__(self)
        self.functions = dict(
                        motor_left = self.motor_left,
                        motor_right = self.motor_right)
    

    def setup_board(self, board):
        """Set up uniboard for api for use
        
        Args:
            board (str): address of uniboard
        
        Returns:
            None
        """
        try:
            self.board = uniboard.Uniboard(board)
            rospy.loginfo('Using real uniboard')
        except:
            self.board = fake_uniboard.Uniboard(board)
            rospy.logwarn('Using Fake Uniboard')


    def setup_ros(self):
        """Initializes node and sets up service. 
        
        Returns:
            None
        """
        rospy.init_node('uniboard_communication')
        self.s = rospy.Service('uniboard_service', 
                            communication, 
                            self.addToQueue)


    def motor_left(self, power):
        """Wrapper for uniboard function uniboard.motor_left
        
        Args:
            power (float): power level to set wheel motor to, between 1 and -1
        
        Returns:
            communication.response: Rosservice response.
        """
        p = float(power)
        self.board.motor_left(p)
        return [True, 'Success', '']

    def motor_right(self, power):
        """Wrapper for uniboard function uniboard.motor_right
        
        Args:
            power (float): power level to set wheel motor to, between 1 and -1
        
        Returns:
            communication.response: Rosservice response.
        """
        p = float(power)
        self.board.motor_right(p)
        return [True, 'Success', '']


    def addToQueue(self, req):
        """Callback for service call
        
        Args:
            req (communication): communication from service caller, see .srv for details
        
        Returns:
            None
        """
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
        """Runs through the queue and does the tasks
        
        Returns:
            None
        """
        while not rospy.is_shutdown():
            if not self.empty():
                item = self.get()
                resp = item[1](item[2])
                item[4].extend(resp)
                self.task_done()
                

if __name__ == '__main__':
    # Initialize the node
    controller = UniboardCommunication()
    controller.setup_board(BOARD)
    controller.setup_ros()
    controller.worker()
    rospy.spin()