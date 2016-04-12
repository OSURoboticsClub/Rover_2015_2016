#!/usr/bin/env python
#roverlib/uniboard test program
#Written 2015-2016 by Nick Ames <nick@fetchmodus.org>

# Author of test and software team API:   
# Collaborators: Stefan Reindel
# Date: 4-11-2016

# python 
import uniboard
import time, sys, os

def usage():
    print "python arm_tester.py"

def clear():
    try:
        os.system('clear')
    except Exception:
        pass
    # try:
    #     os.system('cls')
    # except Exception:
    #     pass
def show_help():
    print "Type the number of the routine you want and press Enter.  ."
    print "Example:\"0 <Enter>\" Homes the arm.  "
def show_orders():
    text = "Type a number or command and press enter to run a routine.  \n"
    text += "Routine Numbers:\n"
    text += "1.  Arm moves down about half way, fully opens end effector, moves the rest of the way down,\n"
    text += "      closes the end effector, and raises the arm to fully height.\n"
    text += "2.  Moves arm half way down.\n"
    text += "3.  Moves arm all the way down.\n"
    text += "4.  Moves arm all the way up.\n"
    text += "5.  Opens arm end effector.\n"
    text += "6.  Closes arm end effector.\n"
    text += "7.  <Empty>\n"
    text += "8.  <Empty>\n"
    text += "9.  <Empty>\n"
    text += "0.  Home's the arm.  \n"
    text += "c / center = moves arm to \"center\"\n"
    text += "q / quit / exit / stop = Exit Program.\n"
    text += "h or help will show help.\n"
    print text
def press_enter_to_continue():
    raw_input("Press Enter to continue")
def arm_test(u=None):
    if u is None:
        u = uniboard.Uniboard("/dev/ttyUSB1")
    try:
        while True:
            opt = run_arm_test(uniboard=u)
            if opt == "Quit":
                break
    except KeyboardInterrupt:
        print "\nExiting..."
        exit(0)
    except Exception as e:
        print str(e)
        print "\nExiting..."
        exit(0)

def run_arm_test(uniboard=None):
    
    clear()
    show_orders()
    cmd = raw_input("Enter a rountine number: >> ")
    if cmd.lower() == "q" or cmd.lower() == "quit" or cmd.lower() == "exit" or cmd.lower() == "stop":
        return "Quit"
    elif cmd.lower() == "h" or cmd.lower() == "help":
        show_help()
        press_enter_to_continue()
        return "Help"
    elif cmd.lower() == "c" or cmd.lower() == "center":
        print "Centering"
        move_arm_XY(uniboard=uniboard, x=uniboard.arm_max("Y"), y=uniboard.arm_max("Y"))
        press_enter_to_continue()
        return "Centering"
    elif cmd.lower() == "home" or cmd.lower() == "0":
        #uniboard.arm_home()
        print "Homing"
        press_enter_to_continue()
        return "Home"
    elif cmd == "1": # Grabs object
        print "Grabbing Object"
        move_arm_half_way(uniboard=uniboard)
        move_arm_A(uniboard=uniboard, a=1)
        move_arm_down(uniboard=uniboard)
        move_arm_A(uniboard=uniboard, a=0)
        move_arm_up(uniboard=uniboard)
        press_enter_to_continue()
    elif cmd == "2": # moves half way
        print "Moving 1/2 Way"
        move_arm_half_way(uniboard=uniboard)
        press_enter_to_continue()
    elif cmd == "3": # Full Down
        print "Moving Down"
        move_arm_down(uniboard=uniboard)
        press_enter_to_continue()
    elif cmd == "4": # Full Up
        print "Moving Up"
        move_arm_up(uniboard=uniboard)
        press_enter_to_continue()
    elif cmd == "5": # Open Hand
        print "Open End Effector"
        
        move_arm_A(uniboard=uniboard, a=1)
        press_enter_to_continue()
    elif cmd == "6": # Close Hand
        print "Closing End Effector"
        
        move_arm_A(uniboard=uniboard, a=0)
        press_enter_to_continue()
    elif cmd == "7": # <Empty>
        print "<Empty>"
        press_enter_to_continue()
    elif cmd == "8": # <Empty>
        print "<Empty>" 
        press_enter_to_continue()
    elif cmd == "9": # <Empty>
        print "<Empty>"
        press_enter_to_continue()
    else:
        print "Command not recognized.  "
        press_enter_to_continue()
    return "Action"

def home(uniboard=None):
    if uniboard is None: return False
    ''' home is not ideal
        So we move the arm back as far as it can after home
    '''
    uniboard.arm_home()                               # set elements to center, test all elements
    # move all the way back (Where we want it)
    move_arm_XY(uniboard=uniboard, x=uniboard.arm_max("X")/2.0, y=uniboard.arm_max("Y")/2.0)
    # Arm is upright at Home
    move_arm_A(uniboard=uniboard, a=0.5)

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
    return True

def move_arm_up(uniboard=None):
    if uniboard is None: return False
    uniboard.arm_target("Z", 0.5)
    uniboard.arm_z_wait_until_done()
    return True

def move_arm_A(uniboard=None, a=None):
    if uniboard is None: return False
    difference = 0.1
    if a is not None:
        if a - 1.0 > difference:
            a = uniboard.arm_max("A")
        uniboard.arm_target("A", a) # Move arm 
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
arm_test()