#Ros Package Instructions
To create a new ROS Package

* Navigate to src folder
    * `cd .../Rover2016/ws/src` 
* Use your package name instead of {pkgName}
* Add any extra dependencies after rospy
* `catkin create pkg {pkgName} --catkin-deps rospy`
* create your source code in the src folder.
* properly fill out the package.xml
* git commit, but do not push to save the structure
* commit along the way but do not push until you have working code. 