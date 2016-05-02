Test 1. Straight Line, Constant Velocity:   
    Required Materials: Measuring tape
* Align rover perpendicular with yard line on turf field.
* run `roslaunch flodometry test_align.launch`
* confirm rover ends path in a straight line from where it started.
* If rover is not straight adjust wheel power offset in flodometry/test/test_real_roving.py 
* when rover is driving straigt run `roslaunch flodometry test_straight.launch`
    - All rosbagging is taken care of by the launch file, the actual distance should be recorded.
                         Run One     Run Two     Run Three
    Distance Forward:               
    Distance Backward: 


Test 2. Constant Rotation:
    Required Materials: Large Protractor (Or some way of measuring angle), stake (Or some way of marking center point)
* Align rover so it's center line is aligned with a yard line. Mark center point
* run `roslaunch flodometry test_rotation.launch`
    - All bagging is done by the launch file, the final angle should be recorded.
                        Run One     Run Two     Run Three
    Angle Forward:               
    Angle Backward:  