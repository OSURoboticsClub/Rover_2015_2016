#!/usr/bin/env python
import rospy
import time

# toggleParam sets the node communication parameter to bool setting
def toggleParam(setting):
	rospy.set_param("/base_goal_param", setting)

# waifForToggle watches the parameter and waits for it to become true
def waitForToggle():
	control = rospy.get_param("/base_goal_param")
	while (control is False):
		print 'waitForToggle: Waiting for param to become true'
		time.sleep(5.0)
		try:
			control = rospy.get_param("/base_goal_param")
			if (control is True):
				break
		except KeyError:
			print 'waitForToggle: param was not set correctly'	

if __name__ == '__main__':
	print 'Main: Waiting for true' 
	waitForToggle()
	print 'Main: Param is true, waiting for 20 secs'
	time.sleep(20)
	print 'Main: Toggling back to false'
	toggleParam(False)
	print 'Main: Waiting for true again'
	waitForToggle()

	
