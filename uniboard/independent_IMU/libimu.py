"""This module is the software interface to indepedent IMU, a component
   of the OSU robotics club's 2016 rover.
   
   Written in a hurry in 2016 by Nick Ames."""
import serial
import sys
import time
import struct
import binascii
import math

class IMU(object):
	"""OSURC 2016 Rover Uniboard interface class. Create an object of this class
	   and use it to talk to the Uniboard."""
	def __init__(self, tty_path):
		"""Initialize an imu class. tty_path is the usb-serial device of the imu (a teensy 3.2)."""
		self._tty_path = tty_path
		self._tty = serial.Serial(port=self._tty_path,
		                          baudrate=1000000, #The baudrate is artificial
	                              parity=serial.PARITY_NONE,
	                              stopbits=serial.STOPBITS_ONE,
	                              bytesize=serial.EIGHTBITS,
	                              timeout=0.005)
		
	def zero(self):
		"""Recalibrate the zero offset of the accelerometer and gyroscope. This function should
		   be called whenever the robot is stationary. WARNING: The robot must remain stationary for
		   at least one second after calling this function."""
		self._tty.write("Z")
		
	def reset(self):
		"""Reset the integration values to 0."""
		self._tty.write("R")

	# hex string to signed integer from http://stackoverflow.com/questions/6727875/hex-string-to-signed-int-in-python-3-2
	def _htosf(self, val):
		uintval = int(val,16)
		bits = 4 * len(val)
		if uintval >= math.pow(2,bits-1):
			uintval = int(0 - (math.pow(2,bits) - uintval))
		return float(uintval)
	
	def _parse_line(self, line):
		"""Parse a data point and return the list of tuples needed by data()."""
		af = 9.81/16384.0; #Factor to convert to m/s^2
		gf = 500.0/32768.0; #Factor to convert to degrees/s
		data = {}
		data["gyro"]  = (self._htosf(line[0:4]) * gf, self._htosf(line[4:8]) * gf, self._htosf(line[8:12]) * gf)
		data["angle"] = (self._htosf(line[12:20]) * gf * .01, self._htosf(line[20:28]) * gf  * .01, self._htosf(line[28:36]) * gf  * .01)
		data["accel"] = (self._htosf(line[36:40]) * af, self._htosf(line[40:44]) * af, -self._htosf(line[44:48]) * af)
		data["vel"]   = (self._htosf(line[48:56]) * af * .01, self._htosf(line[56:64]) * af * .01, -self._htosf(line[64:72]) * af * .01)
		data["pos"]   = (self._htosf(line[72:80]) * af * .0001, self._htosf(line[80:88]) * af * .0001, -self._htosf(line[88:96]) * af * .0001)
		#TODO: convert to degrees/meters
		return data
	
	def data(self):
		"""Retrieve data from the IMU. A list of data points is returned. The oldest data point is the first
		   item in the list (index 0). If no new data is available, an empty list is returned.
		   
		   Each data point is a dictionary with the following keys:
		     "gyro" - current gyroscope data, in degrees/s
		     "accel" - current accelerometer data, in m/s^2
		     "angle" - current angle, in degrees
		     "vel" - velocity, in m/s
		     "pos" - position, in m
		   Each key maps to a tuple of (X, Y, Z)."""
		done = False
		lines = []
		while not done:
			line = self._tty.readline()
			if len(line) == 0:
				done = True
			lines.append(line)
		output = []
		for l in lines:
			if len(l) == 97: #Complete data point
				output.append(self._parse_line(l))
		return output
