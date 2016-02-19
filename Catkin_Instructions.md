# Catkin Instructions
Build using [catkin tools](https://catkin-tools.readthedocs.org/en/latest/),

* To install on Ubuntu use 
    - `sudo apt-get install python-catkin-tools`
* navigate to ws folder
    - Instead of {WorkSpace} use the location where you have Rover2016
    - `cd {WorkSpace}/Rover2016/ws`
* Initialize workspace
    - `catkin init`
* Edit config to point to proper source file
    - Make sure to include the full path to the src folder
* Create install directory if it doesn't already exist
    - `mkdir install`
* Build the workspace
    - `catkin build`
It should successfully build all packages in the src folder 
to "Preview a build" run 'catkin build -n' that invokes the --dry-run option and allows you to see what will be build without building it. 