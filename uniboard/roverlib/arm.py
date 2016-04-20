#!/usr/bin/env python
#roverlib/uniboard test program
#Written 2015-2016 by Nick Ames <nick@fetchmodus.org>

# Author of test and software team API:   
# Collaborators: Stefan Reindel, Nikita Rozanov, Christopher Tucker, Timothy Rice, and Nick Ames
# Date: 4-6-2016

# python 
import uniboard
import time

class Arm():
    """
    This class is intended as an API for ROS for arm manipulation.
    """
    def __init__(self, ub=None, uniboard_location="/dev/ttyUSB1"):
        if ub is None:
            ub = uniboard.Uniboard(uniboard_location)
        self.uniboard_location = uniboard_location
        self.ub = ub                                # Uniboard
        self.axes = ["X", "Y", "Z", "A"]    # Axes
        self.x_boundry = 0.03               # X axis boundry
        self.x_offest = 0.02                   # X axis offset from center
        self.y_boundry = 0.04               # y axis boundry
        self.y_offest = 0.0                      # y axis offest from center
        self.x_center = (ub.arm_max("X") / 2.0) + self.x_offest   # Center after offset
        self.y_center = (ub.arm_max("Y") / 2.0) + self.y_offest   # Center after offset
        self.max_wait_time = 3              # Max wait time for axis movement
        self.time_step = 0.1                    # Time step for wait functions
        self.activate_arm()
        #
    def is_usable(self):
        """
        This functions returns True if the uniboard initialized correctly, False otherwise.
        """
        if self.ub is None:
            return False
        return True
    #
    def activate_arm(self):
        """
        This function activates the arm for use.
        """
        try:
            self.ub.arm_en(axis="X", state=True)
            self.ub.arm_en(axis="Y", state=True)
            self.ub.arm_en(axis="Z", state=True)
            self.ub.arm_en(axis="A", state=True)
            self.ub.arm_go(axis="X", state=True)
            self.ub.arm_go(axis="Y", state=True)
            self.ub.arm_go(axis="Z", state=True)
            self.ub.arm_go(axis="A", state=True)
            return True
        except Exception as e:
            print str(e)
            return False
    def deactivate_arm(self):
        """
        This function pauses the arm.
        '"""
        pass
    # 
    def home(self):
        """
        This function homes the arm.
        """
        self.ub.arm_home()
        return True
    #
    def default(self):
        """
        This function moves the arm into a travelling position.
        """
        self.move_XY(x=self.x_center, y=self.y_center)
        self.move_A(a=0)
        return True
    # 
    def get_side(self):
        """
        This function get the current side of the arm.
        Left of center, Right of center, or centered
        """
        test_loc = self.ub.arm_current("X", None)
        if test_loc > self.x_center: # Left Side
            return "Left"
        elif test_loc < self.x_center: # Right Side
            return "Right"
        else:                                           # Center
            return "Center"

    # ARM MOVEMENT
    def move_X(self, value=0.0, ignore_boundry=False):
        """
        This function moves the arm along the X axis.
        Setting ignore_boundry to True will cause the arm to ignore the slight offset
        from the sides of the arm housing*.  
        *This may result in a crash of the arm onto the housing.
        """
        if value < self.x_boundry and not ignore_boundry:
            value = self.x_boundry
        if value > self.ub.arm_max("X") - self.x_boundry and not ignore_boundry:
            value = self.ub.arm_max("X") - self.x_boundry
        self.ub.arm_target("X", value)
        self.wait_for_X()
        return True
    def move_Y(self, value=0.0, ignore_boundry=False):
        """
        This function moves the arm along the Y axis.
        Setting ignore_boundry to True will cause the arm to ignore the slight offset
        from the sides of the arm housing*.  
        *This may result in a crash of the arm onto the housing.
        """
        if value < self.y_boundry and not ignore_boundry:
            value = self.y_boundry
        if value > self.ub.arm_max("Y") - self.y_boundry and not ignore_boundry:
            value = self.ub.arm_max("Y") - self.y_boundry
        self.ub.arm_target("Y", value)
        self.wait_for_Y()
        return True
    def move_Z(self, value=0.00):#, ignore_boundry=False):
        """
        This function moves the arm along the Z axis.
        """
        self.ub.arm_target("Z", value)
        self.wait_for_Z()
        return True
    def move_A(self, value=0.0):#, ignore_boundry=False):
        """
        This function moves the arm along the Z axis.
        """
        self.ub.arm_target("A", value)
        self.wait_for_A()
        return True
    def move_XY(self, x_value=0.0, y_value=0.0):
        """
        This function moves both the arm along both the X and Y axes at the same time.
        """
        return self.move_X(value=x_value) and self.move_Y(value=y_value) 
        # self.ub.arm_target("X", x_value)
        # self.ub.arm_target("Y", y_value)
        # self.wait_for_X()
        # self.wait_for_Y()
        return True

    # PRESET ARM OPERATIONS
    def center(self):
        # This function moves the arm to the center X and Y coords.
        return self.move_XY(x_value=self.x_center, y_value=self.y_center)
    def grab(self):
        # This function is a preset grab function
        # The arm goes halfway down, opens the end effector, goes down to the ground, 
        # closes the end effector, and brings the up at the end
        self.half_down()
        self.open()
        self.down()
        self.close()
        self.up()
        return True
    def open(self):
        # This function opens the end effector.
        return self.move_A(value=1)
    def close(self):
        # This function closes the end effector.
        return self.move_A(value=0)
    def up(self):
        # This function moves the arm all the way up.
        return self.move_Z(value=0.5)
    def down(self):
        # This function moves the arm al the way down.
        if self.get_side() == "Left":
            return self.move_Z(value=1.0)
        else:
            return self.move_Z(value=0.0)
    def half_down(self):
        # This function moves the arm have way down.
        if self.get_side() == "Left":
            return self.move_Z(value=0.75)
        else:
            return self.move_Z(value=0.25)
    def left(self):
        # This function moves the arm to the far left
        return self.move_X(value=self.ub.arm_max("X"))
    def right(self):
        # This funciton moves the arm to the far right
        return self.move_X(value=0.0)
    def forward(self):
        # This function moves the arm forward all the way.
        # Warning: End Effector may hit camera boom.
        return self.move_Y(value=0.0)
    def back(self):
        return self.move_Y(value=self.ub.arm_max("Y"))
    #
    def wait_for_X(self, time_out=False):
        # This function loops while the X axis is moving
        wait_time = 0
        while self.ub.arm_should_be_moving("X"):
            time.sleep(self.time_step)
            wait_time += self.time_step
            if wait_time > self.max_wait_time and time_out:
                return False
        return True
    def wait_for_Y(self, time_out=False):
        # This function loops while the Y axis is moving
        wait_time = 0
        while self.ub.arm_should_be_moving("Y"):
            time.sleep(self.time_step)
            wait_time += self.time_step
            if wait_time > self.max_wait_time and time_out:
                return False
        return True
    def wait_for_Z(self, time_out=False):
        # This function loops while the Z axis is moving
        wait_time = 0
        while self.ub.arm_should_be_moving("Z"):
            time.sleep(self.time_step)
            wait_time += self.time_step
            if wait_time > self.max_wait_time and time_out:
                return False
        return True
    def wait_for_A(self, time_out=False):
        # This function loops while the A axis is moving
        wait_time = 0
        while self.ub.arm_should_be_moving("A"):
            time.sleep(self.time_step)
            wait_time += self.time_step
            if wait_time > self.max_wait_time and time_out:
                return False
        return True
#End of Class