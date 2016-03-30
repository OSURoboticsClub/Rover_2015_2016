Testing for all ros-nodes can be done with python unittest, part of the nose-tests module and rostest.
[Nose Tests](http://nose.readthedocs.org/en/latest/)
[rostest](http://wiki.ros.org/rostest/Writing)
Look at uniboard_communication node for example,
necessary for testing are:
* executable test_module.py 
* properly formated test_module.test
* modified cmakelists.txt
To run tests either use
'rostest PKG_name test_module.py'
or you can use catkin tools which will build and test
'catking run_tests PKG_name'  