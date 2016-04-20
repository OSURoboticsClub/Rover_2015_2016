#!/usr/bin/env python
#roverlib/uniboard test program
#Written 2015-2016 by Nick Ames <nick@fetchmodus.org>

# Author of test and software team API:   
# Collaborators: Stefan Reindel
# Date: 4-11-2016

# python 
import uniboard
import time, sys, os
from arm import Arm

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
    print "Example:"
    print "\"0\" + <Enter> Homes the arm.  "
    print "\"home\" + <Enter> also Homes the arm."

def show_orders():
    text = "Type a number or command and press enter to run a routine.  \n"
    text += "Routine Numbers:\n"
    text += "1 / grab.  Arm moves down about half way, fully opens end effector, moves the rest of the way down,\n"
    text += "      closes the end effector, and raises the arm to fully height.\n"
    text += "2 / half.  Moves arm half way down.\n"
    text += "3 / down.  Moves arm all the way down.\n"
    text += "4 / up.  Moves arm all the way up.\n"
    text += "5 / open.  Opens arm end effector.\n"
    text += "6 / close.  Closes arm end effector.\n"
    text += "7 / xy.  Move the arm along the X and Y axes according to use input.\n"
    text += "8 / z.  Move the arm a distance entered by the user.\n"
    text += "9 / a.  Open or close the end effector an amount entered by the user.\n"
    text += "0 / home.  Home's the arm.  \n"
    text += "c / center = moves arm to \"center\"\n"
    text += "q / quit / exit / stop = Exit Program.\n"
    text += "h or help will show help.\n"
    print text

def press_enter_to_continue():
    raw_input("Press Enter to continue")

def arm_test():
    clear()
    rover_arm = Arm()
    print "Arm Preperation Complete..."
    try:
        while True:
            print "Ready\n"
            opt = run_arm_test(arm=rover_arm)
            if opt is True:
                print "Action was successful!"
            if opt is False:
                print "[ERROR] Action Failed!"
            time.sleep(2)
            if opt == "Quit":
                break
            #time.sleep(0.5)
            clear()
    except KeyboardInterrupt:
        print "\nExiting..."
        exit(0)
    # except Exception as e:
    #     print "[FATAL ERROR]"
    #     print str(e)
    #     print "\nExiting..."
    #     exit(2)

def run_arm_test(arm=None):
    show_orders()
    cmd = raw_input("Enter a rountine number: >> ")
    if cmd.lower() == "q" or cmd.lower() == "quit" or cmd.lower() == "exit" or cmd.lower() == "stop":
        return "Quit"
    elif cmd.lower() == "h" or cmd.lower() == "help":
        show_help()
        press_enter_to_continue()
        return "Help"
    elif cmd.lower() == "c" or cmd.lower() == "center":
        print "Centering..."
        return arm.center()
    elif cmd.lower() == "home" or cmd.lower() == "0":
        print "Homing"
        return arm.home()
    elif cmd == "1" or cmd == "run" or cmd == "test" or cmd == "grab": # Grabs object
        print "Grabbing Object..."
        return arm.grab()
    elif cmd == "2" or cmd == "half": # moves half way
        print "Moving 1/2 Way..."
        return arm.half_down()
    elif cmd == "3" or cmd == "down": # Full Down
        print "Moving Down..."
        return arm.down()
    elif cmd == "4" or cmd == "up": # Full Up
        print "Moving Up..."
        return arm.up()
    elif cmd == "5" or cmd == "open": # Open Hand
        print "Open End Effector..."
        return arm.open()
    elif cmd == "6" or cmd == "close": # Close Hand
        print "Close End Effector..."
        return arm.close()
    elif cmd == "7" or cmd =="xy": # <Empty>
        print "<CAUTION!> Be aware of the arm high and the end effector so you dont hit them on the camera boom."
        text = raw_input("Enter a X value (in meters from zero): ")
        text.replace("\n", "")
        x_value=float(text)
        text = raw_input("Enter a Y value (in meters from zero): ")
        text.replace("\n", "")
        y_value=float(text)
        #ign = raw_input("Enter a X value (in meters from zero): ")
        #ignore_boundries = True if ign.lower() == "y" or ign.lower() == "yes" else False
        print "Moving Arm along X and Y axes..."
        return arm.move_XY(x_value=x_value, y_value=y_value)
    elif cmd == "8" or cmd =="z": # <Empty>
        print "<CAUTION!> Be careful about which side the arm is on or you might crash the arm."
        z_value=float(raw_input("Enter a Z value (in meters from zero): "))
        print "Moving Arm along Z axis..."
        return arm.move_Z(value=z_value)
        
    elif cmd == "9" or cmd =="a": # <Empty>
        print "<CAUTION!> Be careful about the fingers of the hand colliding with the rover frame."
        a_value=float(raw_input("Enter a X value (in meters from zero): "))
        print "Moving Arm along A axis..."
        return arm.move_A(value=a_value)
    else:
        print "[ERROR] Command not recognized.  "
        press_enter_to_continue()
        return "Bad Command"
    return "Action"

# def run_arm_test(uniboard=None):
#     show_orders()
#     cmd = raw_input("Enter a rountine number: >> ")
#     if cmd.lower() == "q" or cmd.lower() == "quit" or cmd.lower() == "exit" or cmd.lower() == "stop":
#         return "Quit"
#     elif cmd.lower() == "h" or cmd.lower() == "help":
#         show_help()
#         press_enter_to_continue()
#         return "Help"
#     elif cmd.lower() == "c" or cmd.lower() == "center":
#         print "Centering"
#         move_arm_XY(uniboard=uniboard, x=uniboard.arm_max("Y"), y=uniboard.arm_max("Y"))
#         press_enter_to_continue()
#         return "Centering"
#     elif cmd.lower() == "home" or cmd.lower() == "0":
#         uniboard.arm_home()
#         print "Homing"
#         press_enter_to_continue()
#         return "Home"
#     elif cmd == "1": # Grabs object
#         print "Grabbing Object"
#         move_arm_half_way(uniboard=uniboard)

#         move_arm_A(uniboard=uniboard, a=1)
#         #wait_for_competion(uniboard=uniboard)

#         move_arm_down(uniboard=uniboard)
#         move_arm_A(uniboard=uniboard, a=0.2)
#         #wait_for_competion(uniboard=uniboard)

#         move_arm_up(uniboard=uniboard)
#         press_enter_to_continue()
#     elif cmd == "2": # moves half way
#         print "Moving 1/2 Way"
#         move_arm_half_way(uniboard=uniboard)
#         press_enter_to_continue()
#     elif cmd == "3": # Full Down
#         print "Moving Down"
#         move_arm_down(uniboard=uniboard)
#         press_enter_to_continue()
#     elif cmd == "4": # Full Up
#         print "Moving Up"
#         move_arm_up(uniboard=uniboard)
#         press_enter_to_continue()
#     elif cmd == "5": # Open Hand
#         print "Open End Effector"
#         move_arm_A(uniboard=uniboard, a=1)
#         press_enter_to_continue()
#     elif cmd == "6": # Close Hand
#         print "Closing End Effector"
        
#         move_arm_A(uniboard=uniboard, a=0.2)
#         press_enter_to_continue()
#     elif cmd == "7": # <Empty>
#         print "<Empty>"
#         press_enter_to_continue()
#     elif cmd == "8": # <Empty>
#         print "<Empty>" 
#         press_enter_to_continue()
#     elif cmd == "9": # <Empty>
#         print "<Empty>"
#         press_enter_to_continue()
#     else:
#         print "Command not recognized.  "
#         press_enter_to_continue()
#         return False
#     return "Action"

#   ===================================
#   ===================================
#   ===================================
arm_test()