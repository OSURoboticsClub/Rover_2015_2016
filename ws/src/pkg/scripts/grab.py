#!/usr/bin/env python
import rospy
from std_msgs.msg import Bool

MAX_TRIES = 10

def identify_sample():
    
    # TODO: 
    # this function uses the crotch cam and recognition algorithms to 
    # determine if the object under the rover is indeed a sample
    # if it is a sample, it will determine the (x,y) coordinates
    
    # returns a tuple (x,y), or None if sample cannot be confirmed

    return (0,0) # temporary value for testing

def pick_up(xy):
    
    # TODO:
    # this function uses the (x,y) coordinates from the crotch cam to 
    # adjust the rover's and/or arm's position if necessary, and then 
    # pick up the sample

    # returns True if grab was successful, False otherwise

    return True # temporary value for testing

def grab():

    # create publisher that pusblishes Bools to the grab_success topic
    # consumed by scan and nav
    pub = rospy.Publisher('grab_success', Bool, queue_size=10)
    
    # initialize node and name it grab
    rospy.init_node('grab', anonymous=False)

    grab_finished = False
    grab_succ = False
    num_tries = 0
    
    while ((grab_finished == False) and (not rospy.is_shutdown())):
        
        xy = identify_sample()
        if xy is None:
            break
        grab_succ = pick_up(xy)
        if (grab_succ) or (num_tries == MAX_TRIES):
            grab_finished = True

    # logs result and publishes grab_succ on topic grab_success
    rospy.loginfo("grab success" if grab_succ else "grab failure")
    pub.publish(grab_succ)

if __name__ == '__main__':
    try:
        # TODO: only grab when Nav node publishes on inPosition topic
        grab()
    except rospy.ROSInterruptException:
        pass
