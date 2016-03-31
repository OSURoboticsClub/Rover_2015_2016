Setup for ADNS 3080 and arduino.  

Specifications:
-Baud: 14400
- Arduino model: nano v3 ATmega328 
*Please note that basically all these notes are on Ros tutorial website 

1. Have the newest the indigo package installed:
sudo apt-get install arduino 

2. Get the libraries for arduino ros indigo:
sudo apt-get install ros-indigo-rosserial-arduino 

3. install the correct drivers: 
cd Rover2016/ws/src
git clone https://github.com/ros-drivers/rosserial.git
catkin_make
catkin_make install
source ws/install/setup.bash

4.  install ros_libs: 
cd sketchbook/libraries
rm -rf ros_lib 
rosun rsserial_arduino make_libraries.py 

5. For testing run roscore and in a new terminal, this only sets the serial node to run and to set the baud for it (their is a default baud 
if you do not specifiy, which will not be correct). The usb port will also need to be set. 

rosrun rosserial_python serial_node.py {port} _baud:=14400

6. Use echo to display results
