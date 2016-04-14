#!/usr/bin/env python
#roverlib/uniboard test program
#Written 2015-2016 by Nick Ames <nick@fetchmodus.org>

# Author of test and software team API:   
# Collaborators: Stefan Reindel, Nikita Rozanov, Christopher Tucker, Timothy Rice, and Nick Ames
# Date: 4-6-2016

# python 
import uniboard
import time


def arm_test(u = None):
    if u is None:
        u = uniboard.Uniboard("/dev/ttyUSB1")
    print "Homing: {}".format(home(uniboard=u))
    print "XY to Center: {}".format(move_arm_XY(uniboard=u, x=u.arm_max("X")/2, y=u.arm_max("Y")/2))
    print "Arm Down: {}".format(move_arm_down(uniboard=u))
    print "Arm up: {}".format(move_arm_up(uniboard=u))
    print "Effector Open: {}".format(move_arm_A(uniboard=u, a=1.0))
    print "Effector Closed: {}".format(move_arm_A(uniboard=u, a=0.0))
    print "Homing: {}".format(home(uniboard=u))
    return True

def arm_enable_all(uniboard=None):
    try:
        uniboard.arm_en(axis="X", state=True)
        uniboard.arm_en(axis="Y", state=True)
        uniboard.arm_en(axis="Z", state=True)
        uniboard.arm_en(axis="A", state=True)
        uniboard.arm_go(axis="X", state=True)
        uniboard.arm_go(axis="Y", state=True)
        uniboard.arm_go(axis="Z", state=True)
        uniboard.arm_go(axis="A", state=True)
        return True
    except Exception as e:
        print str(e)
        return False
# def arm_stop(uniboard=None):
#     uniboard.arm_en(axis="X", state=True)
#     uniboard.arm_en(axis="Y", state=True)
#     uniboard.arm_en(axis="Z", state=True)
#     uniboard.arm_en(axis="A", state=True)
#     uniboard.arm_en(axis="X", state=True)
#     uniboard.arm_en(axis="Y", state=True)
#     uniboard.arm_en(axis="Z", state=True)
#     uniboard.arm_en(axis="A", state=True)

def home(uniboard=None):
    if uniboard is None: return False
    ''' home is not ideal
        So we move the arm back as far as it can after home
    '''
    uniboard.arm_home()                               # set elements to center, test all elements
    # move all the way back (Where we want it)
    move_arm_XY(uniboard=uniboard, x=uniboard.arm_max("X")/2.0, y=uniboard.arm_max("Y")/2.0)
    # Arm is upright at Home
    move_arm_A(uniboard=uniboard, a=0.2)
    return True

def move_arm_X(uniboard=None, x=None, ignore_boundry=False):
    if uniboard is None: return False
    boundry = 0.03
    if x is not None:
        if x < boundry and not ignore_boundry:
            x = boundry
        if x > uniboard.arm_max("X") - boundry and not ignore_boundry:
            x = uniboard.arm_max("X") - boundry
        uniboard.arm_target("X", x) # Move arm
        #wait_for_competion(uniboard=uniboard)
        return True 
    return False

def move_arm_Y(uniboard=None, y=None, ignore_boundry=False):
    if uniboard is None: return False
    boundry = 0.04
    if y is not None:
        if y < boundry and not ignore_boundry:
            y = boundry
        elif y > uniboard.arm_max("Y") - boundry and not ignore_boundry:
            y = uniboard.arm_max("Y") - boundry
        uniboard.arm_target("Y", y) # Move arm 
        #wait_for_competion(uniboard=uniboard)
        return True
    return False

def move_arm_Z_relative_safe(uniboard=None, z=None, ignore_boundry=False):
    if uniboard is None: return False
    '''
    z:  the arm default is 0.5 (all the way up.)
        if z = 0.5, then it will move the arm al the way down, safely,
        choosing the correct side so that it doesn't hit the side of the arm mount.
    '''

    boundry = 0.04
    fully_up = 0.5
    if z is not None:
        if get_side(uniboard=uniboard) == 1: # Left Side
            uniboard.arm_target("Z", 0.99)
        elif get_side(uniboard=uniboard) == -1: # Right Side
            uniboard.arm_target("Z", 0.0)
        else:
            uniboard.arm_target("Z", 0.99)
        uniboard.arm_z_wait_until_done()
        #wait_for_competion(uniboard=uniboard)
        return True
    return False

def move_arm_down(uniboard=None):
    if uniboard is None: return False
    if get_side(uniboard=uniboard) == 1: # Left Side
        uniboard.arm_target("Z", 0.99)
    elif get_side(uniboard=uniboard) == -1: # Right Side
        uniboard.arm_target("Z", 0)
    else:
        uniboard.arm_target("Z", .99)
    uniboard.arm_z_wait_until_done()
    #wait_for_competion(uniboard=uniboard)
    return True
def move_arm_half_way(uniboard=None):
    if uniboard is None: return False
    if get_side(uniboard=uniboard) == 1: # Left Side
        uniboard.arm_target("Z", 0.75)
    elif get_side(uniboard=uniboard) == -1: # Right Side
        uniboard.arm_target("Z", 0.25)
    else:
        uniboard.arm_target("Z", .75)
    uniboard.arm_z_wait_until_done()
    #wait_for_competion(uniboard=uniboard)
    return True

def move_arm_up(uniboard=None):
    if uniboard is None: return False
    uniboard.arm_target("Z", 0.5)
    uniboard.arm_z_wait_until_done()
    #wait_for_competion(uniboard=uniboard)
    return True

def move_arm_A(uniboard=None, a=None):
    if uniboard is None: return False
    difference = 0.1
    # print "Current A: {}".format(uniboard.arm_current("A", None))
    # print "a= {}".format(a)
    if a is not None:
    #     if a - 1.0 > difference:
    #         a = uniboard.arm_max("A")
    #         print "a= {}".format(a)
        uniboard.arm_target("A", a) # Move arm 
        wait_for_completion(uniboard=uniboard, axis="A")
        return True
    return False

def get_side(uniboard=None):
    if uniboard is None: return False
    test_loc = uniboard.arm_current("X", None)
    offest_from_center = 0.03
    if test_loc > (uniboard.arm_max("X") / 2.0) - offest_from_center: # Left Side
        return 1
    elif test_loc < (uniboard.arm_max("X") / 2.0) - offest_from_center: # Right Side
        return -1
    else:                                           # Center
        return 0

def where_we_at(uniboard=None):
    if uniboard is None: return False
    if get_side(uniboard=uniboard) == 1:
        return "Left Side"
    elif get_side(uniboard=uniboard) == -1:
        return "Right Side"
    else:
        return "Centered Bitch!"

def is_XY_moving(uniboard=None):
    if uniboard is None: return False
    return uniboard.arm_should_be_moving("X") or uniboard.arm_should_be_moving("Y")

def is_axis_moving(uniboard=None, axis="S"):
    if uniboard is None: return False
    return uniboard.arm_should_be_moving(axis)

def is_axes_moving(uniboard=None):
    axes = ["X", "Y", "Z", "A"]
    moving = False
    for a in axes:
        moving = uniboard.arm_should_be_moving(a) or moving
    return moving

def wait_for_completion(uniboard=None, axis="A"):
    max_wait_time = 3
    wait_time = 0
    time_step = 0.1
    while is_axis_moving(uniboard=uniboard, axis=axis):
        time.sleep(time_step)
        wait_time += time_step
        # print "Current {}: {}".format(axis, uniboard.arm_current(axis, None))
        # print "Time Step: {} / {}".format(wait_time, max_wait_time)
        if wait_time > max_wait_time:
            print "Timed Out"
            break


def move_arm_XY(uniboard=None, x=None, y=None):
    if uniboard is None: return False
    wait_time = 0.1
    try:
        move_arm_X(uniboard=uniboard, x=x)
        while is_XY_moving(uniboard=uniboard): 
            time.sleep(wait_time)
        move_arm_Y(uniboard=uniboard, y=y)
        while is_XY_moving(uniboard=uniboard): 
            time.sleep(wait_time)
    except Exception as e:
        return str(e)
    return True

#   ===================================
#   ===================================
#   ===================================
#arm_test()