In order to accurately record our position without updates from octo_map this node needs a lot of work. The current plan is to set up a separate filter for each velocity measurement and combine them together to estimate the position.
The point of this document is to keep track of the tasks that still need to be completed. 
* Calibration for velocity filters.
    - write launch files for testing that include rosbagging to be used in calibration script.
    - Create calibration script that reads bag file as well as user input and creates the config files for odometry. 
* With those calibrated, pray that position estimation works. 