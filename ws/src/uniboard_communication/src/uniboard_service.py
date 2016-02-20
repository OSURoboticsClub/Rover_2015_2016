#!/usr/bin/env python

import rospy
import Queue
from uniboard_communication.srv import *

class UniboardCommunication(Queue.PriorityQueue):
    """
    Handles all communciation with the uniboard for 2016 mars rover
    access functions through ros services never call directly.
    """
    def __init__(self, maxsize=10):
        self.s = rospy.Service('uniboard_service', 
                            communication, 
                            self.put)

    def addToQueue(self, req):
        if self.full():
            pass
            #Queue is full return failed attempt
        else:
            pass



if __name__ == '__main__':
    # Initialize the node
    rospy.init_node('uniboard_communication')
    controller = UniboardCommunication()
    rospy.spin()