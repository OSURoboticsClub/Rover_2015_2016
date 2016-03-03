#!/usr/bin/env python
import rospy
from std_msgs.msg import Bool

MAX_TRIES = 10
ready = False

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

def handle_grab_signal(grab_signal):
    rospy.loginfo("grab signal received")
    global ready
    ready = True

def grab():

    # create publisher that pusblishes Bools to the grab_success topic
    # consumed by scan and nav
    pub = rospy.Publisher('grab_success', Bool, queue_size=10)
    
    # initialize node and name it grab
    rospy.init_node('grab', anonymous=False)
    rospy.loginfo("entered grab state")

    # grab subscribes to grab_signal topic (published by nav)
    rospy.Subscriber("grab_signal", Bool, handle_grab_signal)

    rate = rospy.Rate(10) # 10hz
    global ready

    while not rospy.is_shutdown():

        if ready: # will become true when nav sends the grab_signal
            grab_finished = False
            grab_succ = False
            num_tries = 0
    
            while grab_finished == False:
        
                rospy.loginfo("identifying sample")
                xy = identify_sample()
                if xy is None:
                    rospy.loginfo("sample could not be identified")
                    break
                rospy.loginfo("pick up attempt #{0}".format(num_tries))
                grab_succ = pick_up(xy)
                if (grab_succ) or (num_tries == MAX_TRIES):
                    grab_finished = True

            # logs result and publishes grab_succ on topic grab_success
            rospy.loginfo("grab success" if grab_succ else "grab failure")
            ready = False
            pub.publish(grab_succ)

    rate.sleep()

if __name__ == '__main__':
    try:
        grab()
    except rospy.ROSInterruptException:
        pass
