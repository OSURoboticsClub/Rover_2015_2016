#!/usr/bin/env python
"""uniboard_communication node for OSU Mars Rover 2016

Attributes:
    BOARD (str): usb location of board
    uniboard (TYPE): uniboard module
"""

import rospy
import Queue
import imp
import os, sys
# Importing the uniboard api
uniboard_path = os.path.abspath(__file__)
for i in range(5):
    uniboard_path = os.path.dirname(uniboard_path)
uniboard = imp.load_source('uniboard', 
    (uniboard_path+'/uniboard/roverlib/uniboard.py'))
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
                        motor_right = self.motor_right,
                        encoder_left_rpm = self.encoder_left_rpm,
                        encoder_right_rpm = self.encoder_right_rpm)

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
    
    def encoder_left_rpm(self, *args):
        """Wrapper for uniboard function encoder_left_rpm

       Returns:
            Current speed of the encoder in RPM as a float.
	    Positive values indicate forward rotation
        """
	#RPM = self.functions["encoder_left_rpm"]()
        RPM = self.board.encoder_left_rpm()
        return [True, 'Success', str(RPM)]

    def encoder_right_rpm(self, *args):
        """Wrapper for uniboard function encoder_right_rpm

       Returns:
            Current speed of the encoder in RPM as a float.
	    Positive values indicate forward rotation
        """
        RPM = self.board.encoder_right_rpm()
        return [True, 'Success', str(RPM)]

    def arm_home(self):
        """Wrapper for uniboard function arm_home"""
        self.board.arm_home()
        return [True, 'Success', '']

    def arm_target(self, axis, pos):
        """Wrapper for uniboard function arm_target

        Args:
	     axis: "X", "Y", "Z" or "A"
             pos: position arm should move in meters
        """
        self.board.arm_target(axis, pos)
        return [True, 'Success', '']

    def arm_max(self, axis):
        """Wrapper for uniboard function arm_max

        Args:
	     axis: "X", "Y", "Z" or "A"
        """
        self.board.arm_max(axis)
        return [True, 'Success', '']

    def arm_should_be_moving(self, axis):
        """Wrapper for uniboard function arm_max

        Args:
	     axis: "X", "Y", "Z" or "A"
        
        Returns:
             True if arm should be moving, False otherwise
        """
        moving = self.board.arm_should_be_moving(axis)
        return [True, 'Success', str(moving)]

    def arm_current(self, axis, i):
        """Wrapper for uniboard function arm_current

        Args:
	     axis: "X", "Y", "Z" or "A"
             i: not sure what this does
        
        Returns current position of arm in meters
        """
        pos = self.board.arm_current(axis, i)
        return [True, 'Success', str(pos)]

    def arm_z_wait_until_done(self):
        """Wrapper function for uniboard function arm_z_wait_until_done"""
        self.board.arm_z_wait_until_done()
        return [True, 'Success', '']

    def arm_go(self, axis, state):
        """Wrapper for uniboard function arm_go

        Args:
	     axis: "X", "Y", "Z" or "A"
             state: True means arm can move
        """
        self.board.arm_go(axis, state)
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
