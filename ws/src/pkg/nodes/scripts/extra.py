def pick_up_at(xy, roverarm=None):
    if roverarm is None:
        roverarm = Arm()
    roverarm.home()
    roverarm.default()
    # constants that define the range of the arm
    # from the pit cam's perspective
    # TODO: measure these
    X_CAM_MAX = 800.0
    X_CAM_MIN = 439.0
    Y_CAM_MAX = 425.0
    Y_CAM_MIN = 61.0

    REAL_X = 0.29
    REAL_Y = 0.24

    ACTUAL_CAM_LENGTH_X = X_CAM_MAX-X_CAM_MIN
    ACTUAL_CAM_LENGTH_Y = Y_CAM_MAX-Y_CAM_MIN
    
    # assumes camera is oriented so that (0,0)
    # of the camera corresponds to (0,0) of the arm
    if xy[0] > X_CAM_MAX: 
        rospy.loginfo("the sample is too far right to pick up")
    elif xy[0] < X_CAM_MIN: 
        rospy.loginfo("the sample is too far left to pick up")
    elif xy[1] > Y_CAM_MAX: 
        rospy.loginfo("the sample is too far forward to pick up")
    elif xy[1] < Y_CAM_MIN: 
        rospy.loginfo("the sample is too far backward to pick up")
    else:
        x_sample = xy[0]-X_CAM_MIN
        y_sample = Y_CAM_MAX-(xy[1]-Y_CAM_MIN)

        # convert to meters
        # x_pick/x_arm_max = x_sample/x_cam_max
        x_pick = (x_sample/ACTUAL_CAM_LENGTH_X) * roverarm.ub.arm_max("X")
        y_pick = (y_sample/ACTUAL_CAM_LENGTH_Y) * roverarm.ub.arm_max("Y")
        # x_pick = (x_sample/ACTUAL_CAM_LENGTH_X) * u.arm_max("X")
        # y_pick = (y_sample/ACTUAL_CAM_LENGTH_Y) * u.arm_max("Y")


        # u.arm_target("X", x_pick) # HERE
        # u.arm_target("Y", y_pick) # HERE
        roverarm.move_XY(x_value=x_pick, y_value=y_pick)

        rospy.loginfo("calculated x: " + str(x_pick))
        rospy.loginfo("calculated y: " + str(y_pick))

        #x_pick += 0.07
        x_pick += 0.00
        y_pick -= 0.00

        # while u.arm_should_be_moving("X") or u.arm_should_be_moving("Y"): pass# HERE

        # z_safe_move(u, 0.2)# HERE
        # u.arm_z_wait_until_done()
        roverarm.move_Z_safe(value=0.2)
        # u.arm_target("A", 0.99)# HERE
        roverlib.open()

        
        # time.sleep(5) 
        # z_safe_move(u, 0.047)
        # u.arm_z_wait_until_done()# HERE
        roverarm.move_Z_safe(value=0.047)

        #u.arm_target("A", 0.5)
        #time.sleep(5)

        #u.arm_target("A", 1)
        #time.sleep(2)

        # u.arm_target("A", 0)# HERE
        # time.sleep(3)# HERE
        roverarm.close()

        # z_safe_move(u, 0.5)# HERE
        # u.arm_z_wait_until_done()# HERE
        roverarm.up()u.arm_target("A", .05)
	while u.arm_should_be_moving("A"):
	    time.sleep(.1)
	    u.arm_go("A", True)

