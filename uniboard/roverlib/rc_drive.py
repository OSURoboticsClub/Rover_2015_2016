#!/usr/bin/env python
#Rover RC control program. Lets someone drive the rover using the
#remote control. 
#Written 2015-2016 by Nick Ames <nick@fetchmodus.org>
import uniboard
import time

u = uniboard.Uniboard("/dev/ttyUSB1")

while True:
	#TODO: Adjust channels to the correct RC channels
	if u.rc_valid()[1] == True:
		u.motor_left(-u.rc_value(2))
		u.motor_right(-u.rc_value(3))
	time.sleep(.01)