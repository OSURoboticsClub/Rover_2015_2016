'''
author:         Stefan Reindel
collaborators:  
date:           1-24
last update:    1-24
'''
# Python libray imports
import os, sys, time

# ROS imports

# Rover Lib Imports

#sys.path.append('Rover2016/Python_Code/Logger')

from Logger.Logger import Logger


def main():
	log = Logger()
	log.clear()
	log.log("This is a test.")
	log.debug("This is a test.")
	log.error("This is a test.")
	log.fatal_error("This is a test.")

main()