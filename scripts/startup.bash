#!/bin/bash
# to test run this in terminal (without restarting everytime...)
# sudo service rc.local start

# you can view rc.local here:
# less /etc/rc.local
# 
# startup.bash is called from another startup.bash
# located in /usr/local/bin/startup.bash

# cd /usr/local/bin/
# less startup.bash

# Suggest you edit this file, otherwise you will have to 
# authenticate on every save.
# Call other Bash functions from here if you wan to 
# run things asychonously (Suggested for things 
# that are not dependant on each other).


echo "In Startup.bash."
# The desktop, because ~/ doesnt work :(
DESKTOP=/home/rover/Desktop 
# This is just a shortcut into the current 2016 repo
REPO=$DESKTOP/repo/Rover2016 # This is just a shortcut into the current 2016 repo
# This is another shortcut for the workspace, Rover2016/ws.  Because shortcuts!
WS=$REPO/ws 

# echo "Sourcing..."
# source $REPO/ws/devel/setup.bash

# echo "Launching..."
# roslaunch $WS/src/master.launch

echo "Script Complete..."
exit 0
