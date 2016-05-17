#!/usr/bin/env python
#Independent IMU test program
#Written 2016 by Nick Ames <nick@fetchmodus.org>
import libimu
import time
import numpy

imu = libimu.IMU("/dev/ttyACM0")

imu.zero()
imu.reset()
count = 0
perprint = 50
total = (0,0,0)
while(True):
	for i in imu.data():
		total = tuple(numpy.add(total, i["pos"]))
		if 0 == (count % perprint):
			print "%3.2f, %3.2f, %3.2f"%(total[0]/perprint, total[1]/perprint, total[2]/perprint)
			total = (0, 0, 0)
		count += 1
