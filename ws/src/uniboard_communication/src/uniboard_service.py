#!/usr/bin/env python
# import communication.srv as communication

import rospy
import Queue
from uniboard_communication.srv import *

class UniboardCommunication(object):
    """
    Handles all communciation with the uniboard for 2016 mars rover
    access functions through ros services never call directly.
    """
    def __init__(self):
        s = rospy.Service('uniboard_communication', 
                            communication, 
                            self.addToQueue)

    def addToQueue(self, req):
        pass


if __name__ == '__main__':
    # Initialize the node
    rospy.init_node('uniboard_communication')
    controller = UniboardCommunication()
    rospy.spin()