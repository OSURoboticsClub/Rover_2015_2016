"""This module is the software interface to the OSURC 2016 Rover Uniboard.
The Uniboard performs a variety of functions in the rover's electrical system,
such as controlling the drive wheels and moving the arm. 

Written 2015-2016 by Nick Ames <nick@fetchmodus.org>

Most functions in the Uniboard class send and receive data from the Uniboard,
blocking until the transaction is complete. As a result, each function call takes
at least 80 microseconds to complete.

TODO: Measure average execution time.
TODO: Error handling. """
import serial
import sys
import time
import struct

class Uniboard(object):
	"""OSURC 2016 Rover Uniboard interface class. Create an object of this class
	   and use it to talk to the Uniboard."""
	def __init__(self, tty_path):
		"""Initialize a uniboard class. tty_path is the terminal device of the Uniboard.
		   The FTDI chip on the uniboard creates two ttys in /dev; the second one is used
		   here. If the Uniboard is the only USB->serial device on the system, use "/dev/ttyUSB1".
		   For simulation purposes, tty_path can also be a network address, in the format
		   hostname:ip (example: 10.0.0.3:7000 or localhost:3000)."""
		#TODO: TTY Autodetection function
		#TODO: Network port
		self._tty_path = tty_path
		self._tty = serial.Serial(port=self._tty_path,
		                          baudrate=1000000,
	                              parity=serial.PARITY_NONE,
	                              stopbits=serial.STOPBITS_ONE,
	                              bytesize=serial.EIGHTBITS,
	                              timeout=0.05)
		#self._message("Start. Uniboard connected on %s"%self._tty_path)
		
		#To detect errors, the class keeps track of every register value written to the Uniboard.
		#This is checked (using the register mask to remove read-only bits) against all reads and writes
		#performed (each write results in a reply from the Uniboard with the contents of the register.
		#This dictionary is indexed by the 15-bit peripheral-register address, with the peripheral
		#as the most significant byte. For example, register 3 on peripheral 7 would have the key 0x0703.
		self._shadow_memory = {
			#Motor PWM
			0x0200:127,
			0x0201:127,
			
			#RC Receiver
			#No writeable bits in this peripheral.
			
			#Arm
			0x0400:0x6A,
			0x0402:12000,
			0x0403:0,
			0x0410:0x6A,
			0x0412:12000,
			0x0413:0,
			0x0420:0x6A,
			0x0422:12000,
			0x0423:0,
			0x0430:0x6A,
			0x0432:12000,
			0x0433:0
		}
		
		#Dictionary of peripheral masks. For each peripheral register, 1s in the value in this dictionary
		#indicate writable bits.
		#This dictionary is indexed by the 15-bit peripheral-register address, with the peripheral
		#as the most significant byte. For example, register 3 on peripheral 7 would have the key 0x0703.
		self._periph_mask = {
			#Global Control
			0x0100:0x02,
			
			#Motor PWM
			0x0200:0xFF,
			0x0201:0xFF,
			
			#RC Receiver
			#No writeable bits in this peripheral.
			
			#Arm
			0x0400:0x6F, #The go bit is modified by the Uniboard, so we pretend it is read-only
			0x0402:0xFFFFFFFF,
			#0x0403:0xFFFFFFFF #The steps register is completely writeable, but it's modified
			                   #by the Uniboard, so we pretend it's read-only to prevent mismatches.
			0x0410:0x6F, #The go bit is modified by the Uniboard, so we pretend it is read-only
			0x0412:0xFFFFFFFF,
			#0x0413:0xFFFFFFFF #The steps register is completely writeable, but it's modified
			                   #by the Uniboard, so we pretend it's read-only to prevent mismatches.
			0x0420:0x6F, #The go bit is modified by the Uniboard, so we pretend it is read-only
			0x0422:0xFFFFFFFF,
			#0x0423:0xFFFFFFFF #The steps register is completely writeable, but it's modified
			                   #by the Uniboard, so we pretend it's read-only to prevent mismatches.
			0x0430:0x6F, #The go bit is modified by the Uniboard, so we pretend it is read-only
			0x0432:0xFFFFFFFF,
			#0x0433:0xFFFFFFFF #The steps register is completely writeable, but it's modified
			                   #by the Uniboard, so we pretend it's read-only to prevent mismatches.
		}
		
		#Dictionary of register sizes, in bytes.
		#This dictionary is indexed by the 15-bit peripheral-register address, with the peripheral
		#as the most significant byte. For example, register 3 on peripheral 7 would have the key 0x0703.
		self._periph_size = {
			#Global Control
			0x0100:1,
			0x0101:2,
			0x0102:4,
			0x0103:4,
			0x0104:2,
			
			#Motor PWM
			0x0200:1,
			0x0201:1,
			
			#RC Receiver
			0x0700:1,
			0x0701:1,
			0x0702:1,
			0x0703:1,
			0x0704:1,
			0x0705:1,
			0x0706:1,
			
			#Arm
			0x0400:1,
			0x0401:1,
			0x0402:4,
			0x0403:4,
			0x0410:1,
			0x0411:1,
			0x0412:4,
			0x0413:4,
			0x0420:1,
			0x0421:1,
			0x0422:4,
			0x0423:4,
			0x0430:1,
			0x0431:1,
			0x0432:4,
			0x0433:4,
			0x040A:2,
			0x040B:2,
			0x040C:2,
			0x040D:2,
		}
		
		self._arm_data = {
			"X":{
					"target":0,       #target and max are in (full, non-microstepped) steps away from the limit.
					"max":1050, #12.5 in/
					"scale":0.00030238095,    #Multiplier to convert steps to meters (scale = meters/steps)
					"dirpol":0,       #Value of DIR line when traveling away from limit
					"frequency":100,  #Full step frequency, in Hz
					"steppol":1,      #Value of STEPPOL bit
					"enpol":0,        #State of EN line when driver is enabled
					"faultpol":0,     #State of fault line that indicated a problem
					"microsteps":32,  #Number of microsteps. Should be 1, 2, 4, 8, 16, or 32
					"regprefix":0x00, #Value to be ORed with the register lower nibble to get the registers of this axis
			},
			"Y":{
					"target":0,       #target and max are in (full, non-microstepped) steps away from the limit.
					"max":900,
					"scale":0.0003095625,	 #Multiplier to convert steps to meters (scale = meters/steps)
					"dirpol":0,       #Value of DIR line when traveling away from limit
					"frequency":100,  #Full step frequency, in Hz
					"steppol":1,      #Value of STEPPOL bit
					"enpol":0,        #State of EN line when driver is enabled
					"faultpol":0,     #State of fault line that indicated a problem
					"microsteps":32,  #Number of microsteps. Should be 1, 2, 4, 8, 16, or 32
					"regprefix":0x10, #Value to be ORed with the register lower nibble to get the registers of this axis
			},
			"Z":{
					"target":0,       #target and max are in (full, non-microstepped) steps away from the limit.
					"max":4100,
					"scale":0.000243,    #Multiplier to convert steps to meters (scale = meters/steps)
					"dirpol":1,       #Value of DIR line when traveling away from limit
					"frequency":400,  #Full step frequency, in Hz
					"steppol":1,      #Value of STEPPOL bit
					"enpol":1,        #State of EN line when driver is enabled
					"faultpol":0,     #State of fault line that indicated a problem
					"microsteps":8,  #Number of microsteps. Should be 1, 2, 4, 8, 16, or 32
					"regprefix":0x20, #Value to be ORed with the register lower nibble to get the registers of this axis
			},
			"A":{
					"target":0,       #target and max are in (full, non-microstepped) steps away from the limit.
					"max":800,
					"scale":.001428,    #Multiplier to convert steps to meters (scale = meters/steps)
					"dirpol":0,       #Value of DIR line when traveling away from limit
					"frequency":150,  #Full step frequency, in Hz
					"steppol":1,      #Value of STEPPOL bit
					"enpol":0,        #State of EN line when driver is enabled
					"faultpol":0,     #State of fault line that indicated a problem
					"microsteps":32,  #Number of microsteps. Should be 1, 2, 4, 8, 16, or 32
					"regprefix":0x30, #Value to be ORed with the register lower nibble to get the registers of this axis
			}
		}
		for axis in self._arm_data:
			self._set_microsteps(axis, self._arm_data[axis]["microsteps"])
			self._set_step_pol(axis, self._arm_data[axis]["steppol"])
			self._set_frequency(axis, self._arm_data[axis]["frequency"] * self._arm_data[axis]["microsteps"])
	
	#Public API Starts Here
	#Global Control
	def paused(self):
		"""Returns True if the rover is paused and False if it is not."""
		if self._read_reg(1,0) != 0:
			return True
		else:
			return False
		
	def force_pause(self, pause_state=None):
		"""Set/get the forced-pause state of the rover. If True, the rover will
		   be paused regardless of the pause input from the remote. If False,
		   the forced pause will be disabled. However, the rover will still be
		   paused if commanded by the remote. If no argument is supplied, the
		   current force_pause state will be returned (True or False)."""
		if pause_state == None:
			state = self._read_reg(1, )
			return state & 0x02 != 0
		else:
			if pause_state:
				self._write_reg(1,0,2)
			else:
				self._write_reg(1,0,0)
			
	def battery_voltage(self):
		"""Return the battery voltage in volts."""
		return float(self._read_reg(1,1)) * .001
	
	def uptime(self):
		"""Return the number of seconds that the Uniboard has been powered on."""
		return self._read_reg(1,2)
	
	def hdl_version(self):
		"""Return the Uniboard HDL version (a unique version number that increments with each
		   build of the HDL code."""
		return self._read_reg(1,3)
	
	def api_version(self):
		"""Return the Uniboard API version, as a tuple (major, minor). The API is specified in the
		   matching revision of the manual."""
		raw = self._read_reg(1,4)
		t = ((raw >> 8), raw & 0xFF)
		return t
	
	#Drive Motors
	def motor_left(self, speed_f):
		"""Set the left drive motors' speed. speed_f is a float from -1 to 1, with -1 meaning reverse,
		   0 meaning stop, and 1 meaning full forward."""
		if not isinstance(speed_f, float):
			speed_f = 0.0
		speed_f = -speed_f
		intvalue = int((speed_f + 1) * 127)
		self._write_reg(2, 0, intvalue)
	
	def motor_right(self, speed_f):
		"""Set the right drive motors' speed. speed_f is a float from -1 to 1, with -1 meaning reverse,
		   0 meaning stop, and 1 meaning full forward."""
		if not isinstance(speed_f, float):
			speed_f = 0.0
		speed_f = -speed_f
		intvalue = int((speed_f + 1) * 127)
		self._write_reg(2, 1, intvalue)
	
	#Arm
	def arm_target(self, axis, target=None):
		"""Set/get the target (position the arm should move toward) of an arm axis, in meters.
		   If target is None, the current target is returned. Note that in order for the
		   arm to move, the driver must be enabled (with arm_en()), go must be set (with arm_go()),
		   and the rover must not be paused. Additionally, arm_home() should be run before
		   using the arm. Axis can be a string ("X", "Y", "Z", or "A") or an 
		   integer (0, 1, 2, or 3), respectively."""
		scale = self._arm_data[self._arm_key(axis)]["scale"]
		if target == None:
			return self._arm_data[self._arm_key(axis)]["scale"] * self._arm_data[self._arm_key(axis)]["target"]
		
		if target > self.arm_max(axis):
			raise ValueError("Requested axis %s target %fm larger than maximum of %fm."%(str(axis), target, self.arm_max(axis)))
		if target< 0:
			raise ValueError("Requested axis %s target %fm is less than 0."%(str(axis), target))
		
		prev_go = self.arm_go(axis)
		self.arm_go(axis, False) #Stop the arm, so that we can get a valid number if it's moving
		
		prev_target_ms = self._arm_data[self._arm_key(axis)]["target"] * self._arm_data[self._arm_key(axis)]["microsteps"]
		prev_conf_reg = self._read_reg(4, self._arm_reg(axis, 0))
		prev_dirstate = bool(prev_conf_reg & 0x20) 
		add = self._arm_data[self._arm_key(axis)]["dirpol"] ^ prev_dirstate
		prev_steps_ms = self._read_reg(4, self._arm_reg(axis, 3))
		if add:
			current_ms = prev_target_ms + prev_steps_ms
		else:
			current_ms = prev_target_ms - prev_steps_ms
		
		
		target_s = target / scale
		target_ms = target_s * self._arm_data[self._arm_key(axis)]["microsteps"]
		new_steps_ms = abs(target_ms - current_ms)
		fwd = target_ms > current_ms
		
		self._arm_data[self._arm_key(axis)]["target"] = target_s
		if not (fwd ^ self._arm_data[self._arm_key(axis)]["dirpol"]):
			conf_reg = prev_conf_reg | 0x20
		else:
			conf_reg = prev_conf_reg & ~0x20
		self._write_reg(4, self._arm_reg(axis, 0), conf_reg)
		self._write_reg(4, self._arm_reg(axis, 3), int(new_steps_ms))
		self.arm_go(axis, prev_go)
		
	def arm_set(self, axis, new_current_pos):
		"""Set the current position of the arm, in meters. Calling this function stops all motion
		   in the selected axis.
		   This function is used during homing."""
		prev_go = self.arm_go(axis)
		self.arm_go(axis, False)
		self._arm_data[self._arm_key(axis)]["target"] = new_current_pos / self._arm_data[self._arm_key(axis)]["scale"]
		self.arm_go(axis, prev_go)
		
	def arm_raw_move(self, axis, distance):
		"""Tell the Uniboard to move an axis a certain distance (in meters) without
		    updating any internal arm data."""
		"""Set/get the target (position the arm should move toward) of an arm axis, in meters.
		   If target is None, the current target is returned. Note that in order for the
		   arm to move, the driver must be enabled (with arm_en()), go must be set (with arm_go()),
		   and the rover must not be paused. Additionally, arm_home() should be run before
		   using the arm. Axis can be a string ("X", "Y", "Z", or "A") or an 
		   integer (0, 1, 2, or 3), respectively."""
		steps_ms = (distance / self._arm_data[self._arm_key(axis)]["scale"]) * self._arm_data[self._arm_key(axis)]["microsteps"]
		if distance < 0:
			new_dir = self._arm_data[self._arm_key(axis)]["dirpol"] ^ 1
		else: 
			new_dir = self._arm_data[self._arm_key(axis)]["dirpol"]
		
		conf_reg = self._read_reg(4, self._arm_reg(axis, 0))
		if new_dir > 0:
			conf_reg |= 0x20
		else:
			conf_reg &= ~0x20
		steps_int = int(steps_ms)
		if steps_int < 0:
			steps_int = -steps_int
		self._write_reg(4, self._arm_reg(axis, 0), conf_reg)
		self._write_reg(4, self._arm_reg(axis, 3), steps_int)
		
		
	def arm_current(self, axis, current):
		"""Return the current position of the given axis, in meters.
		   Axis can be a string ("X", "Y", "Z", or "A") or an 
		   integer (0, 1, 2, or 3), respectively."""
		#The current position of the axis is the target position with the value in the steps
		#register added or subtracted, as the steps register contains the difference between
		#current and target values. Addition or subtraction is controlled by the DIR state.
		#If it indicates that the axis is moving in a positive direction, then the current must
		#be smaller than the target, so current = target - steps. The opposite is true for a
		#negative DIR.
		#The value in the steps register includes microsteps. To deal with this,
		#the target value is converted to microsteps as well.
		target_ms = self._arm_data[self._arm_key(axis)]["target"] * self._arm_data[self._arm_key(axis)]["microsteps"]
		dirstate = bool(self._read_reg(4, self._arm_reg(axis, 0)) & 0x20) 
		add = self._arm_data[self._arm_key(axis)]["dirpol"] ^ dirstate
		steps_ms = self._read_reg(4, self._arm_reg(axis, 3))
		if add:
			current_ms = target_ms + steps_ms
		else:
			current_ms = target_ms - steps_ms
		return float(current_ms)/self._arm_data[self._arm_key(axis)]["microsteps"] * self._arm_data[self._arm_key(axis)]["scale"]
	
	def arm_en(self, axis, state=None):
		"""Get or set the current on/off state of the given axis's stepper driver.
		   If no state argument is returned, the state (True=on, False=off) is returned.
		   Axis can be a string ("X", "Y", "Z", or "A") or an 
		   integer (0, 1, 2, or 3), respectively."""
		enpol = bool(self._arm_data[self._arm_key(axis)]["enpol"])
		conf_reg = self._read_reg(4, self._arm_reg(axis, 0))
		if state == None: #Get current
			return enpoln == bool(cont_reg & 0x40)
		else:
			if not (enpol ^ state):
				self._write_reg(4, self._arm_reg(axis, 0), conf_reg | 0x40)
			else:
				self._write_reg(4, self._arm_reg(axis, 0), conf_reg & ~0x40)
			
	def arm_go(self, axis, state=None):
		"""Get or set the current stop/move state of the given axis.
		   If no state argument is returned, the state (True=can move, False=stopped) is returned.
		   Axis can be a string ("X", "Y", "Z", or "A") or an 
		   integer (0, 1, 2, or 3), respectively."""
		conf_reg = self._read_reg(4, self._arm_reg(axis, 0))
		if state == None: #Get current
			return bool(conf_reg & 0x80)
		else:
			if state:
				self._write_reg(4, self._arm_reg(axis, 0), conf_reg | 0x80)
			else:
				self._write_reg(4, self._arm_reg(axis, 0), conf_reg & ~0x80)
				
	def arm_max(self, axis):
		"""Return the maximum displacement of an axis, in meters. Axis can
		   be a string ("X", "Y", "Z", or "A") or an integer (0, 1, 2, or 3), respectively."""
		data = self._arm_data[self._arm_key(axis)]
		return float(data["max"]) * data["scale"]
	
	def arm_moving(self, axis):
		"""Returns True is the given axis is currently in motion.
		   Axis can be a string ("X", "Y", "Z", or "A") or an 
		   integer (0, 1, 2, or 3), respectively."""
		return bool(self._read_reg(4, self._arm_reg(axis, 1)) & 0x04)
	
	def arm_fault(self, axis):
		"""Returns True is the given axis's driver is indicating a problem.
		   Axis can be a string ("X", "Y", "Z", or "A") or an 
		   integer (0, 1, 2, or 3), respectively."""
		faultpol = bool(self._arm_data[self._arm_key(axis)]["faultpol"]) 
		return not (faultpol ^ bool(self._read_reg(4, self._arm_reg(axis, 1)) & 0x02))
	
	def arm_limit(self, axis):
		"""Returns True is the given axis is at is (negative) limit.
		   Axis can be a string ("X", "Y", "Z", or "A") or an 
		   integer (0, 1, 2, or 3), respectively."""
		return bool(self._read_reg(4, self._arm_reg(axis, 1)) & 0x01)
	
	def arm_home(self):
		"""Home all arm axises. After homing, X and Y will be in the middle of their travel
		   (arm_max()/2), the gripper will be at its 0 position (fully closed), and Z will be
		   fully upright (.5). After homing, all axises will be enabled and have their go bits
		   set True. Before calling this function, the Z axis must be mostly upright."""
		for axis in ["X", "Y", "Z", "A"]:
			self.arm_en(axis, True)
			self.arm_go(axis, True)
		
		#First, move X and Y to their limit switches
		if not self.arm_limit("X"):
			self.arm_raw_move("X", -self.arm_max("X"))
		if not self.arm_limit("Y"):
			self.arm_raw_move("Y", -self.arm_max("Y"))
		while self.arm_moving("X") or self.arm_moving("Y"):
			time.sleep(1)
		for axis in ["X", "Y"]:
			self.arm_en(axis, True)
			self.arm_go(axis, True)
			self.arm_set(axis, 0)
			self.arm_raw_move(axis, 0)
		
		#Center X and Y
		self.arm_target("X", self.arm_max("X")/2)
		self.arm_target("Y", self.arm_max("Y")/2)
		while self.arm_should_be_moving("X") or self.arm_should_be_moving("Y"):
			#Due to contact bounce, spurious limit switch presses can occur,
			#setting go to False.
			self.arm_go("X", True)
			self.arm_go("Y", True)
			time.sleep(.2)
		
		#Home gripper
		
		#Move Z until it hits the limit
		if not self.arm_limit("Z"):
			self.arm_raw_move("Z", -.3)
		while self.arm_moving("Z"):
			time.sleep(1)
		self.arm_en("Z", True)
		self.arm_go("Z", True)
		self.arm_set("Z", .25 * self.arm_max("Z"))
		self.arm_raw_move("Z", 0)
		#Make Z upright
		self.arm_target("Z", .5)
		while self.arm_should_be_moving("Z"):
			#Due to contact bounce, spurious limit switch presses can occur,
			#setting go to False.
			self.arm_go("Z", True)
			time.sleep(.2)
			
	def arm_should_be_moving(self, axis):
		"""Returns True if an axis's uniboard steps register is not 0."""
		return self._read_reg(4, self._arm_reg(axis, 3)) != 0
	
	def arm_z_wait_until_done(self):
		"""Return when the Z axis is finished moving. This function also shepards the
		   Z through the limit switch press that occurs at z=.25."""
		while self.arm_should_be_moving("Z"):
			#Due to contact bounce, spurious limit switch presses can occur,
			#setting go to False.
			self.arm_go("Z", True)
			time.sleep(.2)
			
	def _arm_key(self, axis):
		"""Return the key used in the _arm_data dictionary based on an axis name. Axis can
		   be a string ("X", "Y", "Z", or "A") or an integer (0, 1, 2, or 3), respectively.
		   If axis is invalid, ValueError is thrown."""
		if axis == "X" or axis == 0:
			return "X"
		elif axis == "Y" or axis == 1:
			return "Y"
		elif axis == "Z" or axis == 2:
			return "Z"
		elif axis == "A" or axis == 3:
			return "A"
		else:
			raise ValueError("Invalid arm axis name");
	
	def _arm_reg(self, axis, reg):
		"""Return the complete arm register number for a given axis, given an axis and
		   the lower nibble of the register. Axis can be a string ("X", "Y", "Z", or "A") 
		   or an integer (0, 1, 2, or 3), respectively. This function does not work
		   with the analog input registers."""
		return self._arm_data[self._arm_key(axis)]["regprefix"] | reg;
	
	def _set_microsteps(self, axis, microsteps):
		"""Set the microsteps value in the Configuration register of the given arm axis.
		   Axis can be a string ("X", "Y", "Z", or "A") or an integer (0, 1, 2, or 3), 
		   respectively. Microsteps is 1, 2, 4, 8, 16, or 32."""
		if microsteps not in (1, 2, 4, 8, 16, 32):
			raise ValueError("Incorrect microsteps value")
		reg_ms = {1:0, 2:1, 4:2, 8:3, 16:4, 32:5}
		reg = self._arm_reg(axis, 0)
		prev_rvalue = self._read_reg(0x04, reg)
		prev_rvalue &= ~0x07
		prev_rvalue |= reg_ms[microsteps]
		self._write_reg(0x04, reg, prev_rvalue)
	
	def _set_frequency(self, axis, freq):
		"""Set the step frequency of an arm axis. Axis can be a string 
		   ("X", "Y", "Z", or "A") or an integer (0, 1, 2, or 3), 
		   respectively. Freq is in Hz."""
		period = int(12e6/float(freq))
		self._write_reg(4, self._arm_reg(axis, 2), period)
	
	def _set_step_pol(self, axis, value):
		"""Set the step polarity bit to the given value (1 or 0). Axis can be a string 
		   ("X", "Y", "Z", or "A") or an integer (0, 1, 2, or 3), respectively."""
		reg = self._arm_reg(axis, 0)
		prev_rvalue = self._read_reg(0x04, reg)
		if value:
			prev_rvalue |= 0x08
		else:
			prev_rvalue &= ~0x08
		self._write_reg(0x04, reg, prev_rvalue)
	
	#RC Receiver
	def rc_valid(self):
		"""Returns a dictionary (with keys 1, 2, 3, 4, 7, and 8) containing
		   True/False values indicating if the RC channel with the corresponding
		   key is receiving a valid PWM signal."""
		reg = self._read_reg(7, 0)
		valid = {}
		valid[1] = ((reg & 0x01) != 0)
		valid[2] = ((reg & 0x02) != 0)
		valid[3] = ((reg & 0x04) != 0)
		valid[4] = ((reg & 0x08) != 0)
		valid[7] = ((reg & 0x40) != 0)
		valid[8] = ((reg & 0x80) != 0)
		return valid
	
	def rc_value(self, channel):
		"""Returns the value (from -1 to 1, corresponding to 1ms to 2ms pulse width) on the
		   requested RC channel (1, 2, 3, 4, 7, or 8). If the RC channel is not receiving a valid
		   signal, None is returned."""
		if channel not in [1, 2, 3, 4, 7, 8]:
			raise ValueError("Invalid RC channel; expected 1, 2, 3, 4, 7, or 8.");
		
		valid = self.rc_valid()
		if(channel <= 4):
			value = self._read_reg(7, channel);
		else:
			value = self._read_reg(7, channel - 2);
		if valid[channel]:
			return (float(value) / 127.5) - 1.0
		else:	
			return None
	
	
	def hex_str(self, value):
		"""Convert a number to a string of hexadecimal digits, in the form "0x123ABD..."."""
		return "0x" + format(value, '0X')
	
	#Public API Ends Here
	def _message(self, string):
		"""Print message to stderr, prepending librover and the time and appending a newline."""
		sys.stderr.write("librover [" + time.asctime(time.localtime()) + "]: " + string + "\n")
	def _error(self, string):
		"""Print error to stderr, prepending librover and the time and appending a newline."""
		sys.stderr.write("librover [" + time.asctime(time.localtime()) + "]: error: " + string + "\n")
		
	def _send(self, data, dont_escape_firstlast=True):
		"""Send a string of bytes to the Uniboard port. Escaping of special characters is performed
		   by this function."""
		escaped_data = ""
		for i,c in enumerate(data):
			if c == chr(0x01) or c == chr(0x1B) or c == chr(0x17):
				if (i == 0 or i == len(data)-1) and dont_escape_firstlast:
					pass #Do nothing here. This could be re-written to eliminate the else
				         #but I think the logic is clearer this way
				else:
					escaped_data += chr(0x1B) #Prefix special character with escape
			escaped_data += c
		self._tty.write(escaped_data)

	def _recv(self, num_bytes):
		"""Receive num_bytes bytes from the Uniboard port. The bytes are returned as a string.
		   Escape characters are removed transparently by this function, and do not count
		   toward the number of received bytes."""
		#TODO: Timeout/error handling
		count = 0;
		escaped = False;
		received = ""
		while count < num_bytes:
			count += 1
			c = self._tty.read(size=1)
			if escaped:
				received += c
				escaped = False
			else:
				if c == 0x1B:
					escaped = True
				else:
					received += c
		return received
	
	def _recv_reply(self):
		"""Receive a complete reply (signaled by an end character) from the Uniboard port. 
		   The bytes are returned as a string.
		   Escape characters are removed transparently by this function, and do not count
		   toward the number of received bytes."""
		#TODO: Timeout/error handling
		escaped = False;
		received = ""
		while True:
			c = self._tty.read(size=1)
			if escaped:
				received += c
				escaped = False
			else:
				if c == chr(0x1B):
					escaped = True
				else:
					received += c
					if c == chr(0x17):
						break
		return received
	
	def _check_reply(self, peripheral, register, value):
		"""Check a reply from the Uniboard against the shadow memory and for the correct
		   number of bytes. Value is a list or string containing the data bytes from the packet.
		   On error, a message will be printed to stderr."""
		if self._rsize(peripheral, register) != len(value):
			self._error("Reply data wrong size. Peripheral/register: 0x%02X/0x%02X. Expected size: %d. Received size: %d."%(peripheral, register, self._rsize(peripheral, register), len(value)))
			return
		if self._rsize(peripheral, register) == 0:
			return
		e_value = self._shadow_memory.get(self._k(peripheral, register), 0) & self._periph_mask.get(self._k(peripheral, register), 0)
		a_value = self._btn(value) & self._periph_mask.get(self._k(peripheral, register), 0)
		if e_value != a_value:
			#TODO: Create visualization function (read-only bits as Xs). 
			self._error("Reply data different than expected. Peripheral/register: 0x%02X/0x%02X. Expected %s, got %s."%(peripheral, register, self.hex_str(e_value), self.hex_str(a_value)))
			
	def _btn(self, byte_data):
		"""Convert a 1-4 byte string to a number."""
		size = len(byte_data)
		n = ord(byte_data[0]);
		if(size > 1):
			n |= (ord(byte_data[1]) << 8)
		if(size > 2):
			n |= (ord(byte_data[2]) << 16)
		if(size > 3):
			n |= (ord(byte_data[3]) << 24)
		return n
	
	def _k(self, peripheral, register):
		"""Return a key value that can be used to look up registers in the database.
		   peripheral and register must be numbers."""
		return ((peripheral & 127) << 8 | register)
	
	def _rsize(self, peripheral, register):
		"""Return the size of a register. Unknown registers return 0."""
		return self._periph_size.get(self._k(peripheral, register), 0)
		
	def _process_reply(self, expected_peripheral, expected_register):
		"""Receive and check a reply, returning the data as a number based on the size of register.
		   If no data is returned, or if the register is 0 bytes in size, None is returned."""
		r = self._recv_reply()
		if len(r) < 4:
			self._error("Reply too small. Expected peripheral/register: 0x%02X/0x%02X. Reply: %s"%(expected_peripheral, expected_register, " ".join("{:02x}".format(ord(c)) for c in r)))
		if r[0] != chr(0x01):
			self._error("Incorrect start character in reply. Expected peripheral/register: 0x%02X/0x%02X. Reply: %s"%(expected_peripheral, expected_register, " ".join("{:02x}".format(ord(c)) for c in r)))
		if r[1] != chr(expected_peripheral):
			self._error("Incorrect peripheral in reply. Expected peripheral/register: 0x%02X/0x%02X. Reply: %s"%(expected_peripheral, expected_register, " ".join("{:02x}".format(ord(c)) for c in r)))
		if r[2] != chr(expected_register):
			self._error("Incorrect register in reply. Expected peripheral/register: 0x%02X/0x%02X. Reply: %s"%(expected_peripheral, expected_register, " ".join("{:02x}".format(ord(c)) for c in r)))
		size = self._rsize(expected_peripheral, expected_register)
		data = r[3:-1]
		if size != len(data):
			self._error("Reply data wrong size. Peripheral/register: 0x%02X/0x%02X. Expected size: %d. Received size: %d."%(expected_peripheral, expected_register, size, len(data)))
		if len(r) > 4:
			self._check_reply(expected_peripheral, expected_register, data)
			return self._btn(data)
		else:
			return None
	
	def _clear_input(self):
		"""Clear the serial input buffer. This is a wrapper around pySerial's command,
		   whose name varies with version."""
		#TODO: Work correctly regardless of version
		self._tty.flushInput()
		
	def _compose_command(self, peripheral, register, num_value, read = True):
		"""Return a string containing a command. The proper register size
		   is looked up from the database. Use num_value = None when reading."""
		cmd = ""
		cmd += chr(0x01)
		if read:
			cmd += chr(peripheral | 0x80)
		else:
			cmd += chr(peripheral)
		cmd += chr(register)
		size  = self._rsize(peripheral, register)
		if None == num_value:
			size = 0
		if size > 0:
			cmd += chr((num_value >> 0) & 0xFF)
		if size > 1:
			cmd += chr((num_value >> 8) & 0xFF)
		if size > 2:
			cmd += chr((num_value >> 16) & 0xFF)
		if size > 3:
			cmd += chr((num_value >> 24) & 0xFF)
		cmd += chr(0x17)
		return cmd
	
	def _write_reg(self, peripheral, register, value):
		"""Write a Uniboard register, checking for a correct using the read-back.
		   Value is a number."""
		self._clear_input()
		self._shadow_memory[self._k(peripheral, register)] = value
		self._send(self._compose_command(peripheral, register, value, read = False))
		self._process_reply(peripheral, register)
	
	def _read_reg(self, peripheral, register):
		"""Read a Uniboard register and return its contents. If the register's
		   writeable bits (if any) differ from those in this class's database,
		   an error will be reported."""
		self._clear_input()
		self._send(self._compose_command(peripheral, register, None, read = True))
		return self._process_reply(peripheral | 0x80, register)
	