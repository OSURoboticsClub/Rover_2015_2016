/*
 * HomeBase.hpp
 *
 *  Created on: May 1, 2015
 *      Author: scott
 */

#ifndef HOMEBASE_HPP_
#define HOMEBASE_HPP_

#include "opencv2/core/core.hpp"
#include "opencv2/video/tracking.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/calib3d/calib3d.hpp"

#include <iostream>
#include <ctype.h>
#include <vector>
#include <sys/time.h>
#include <stdio.h>
#include <math.h>
#include <string>
#include <time.h>
#include <stdlib.h>

#define RES_WIDTH  808
#define RES_HEIGHT 608

#define ALIGN_THRESH 10
#define FWD 1
#define TURN_RIGHT 2
#define TURN_LEFT 3
#define FARAWAY 5000
#define CLOSE 2000
#define NEAR_DIST 1000

#define FRONT 1
#define BACK 2
#define CANT_FIND -12345
#define FRONT_ROWS 3
#define FRONT_COLS 5
#define BACK_ROWS 3
#define BACK_COLS 4
#define FRONT_SZIE 180.0
#define BACK_SZIE 200.0
#define TRAIN_DIST5 5000.0
#define TRAIN_DIST10 10000.0
#define TILT_THRESH 35

/* These are hardcoded in the training function since the #defines are not working right

#define FRONT_TRAIN5 = "./src/locate_home_base/src/Front_5m.png"; 
#define FRONT_TRAIN10 = "./src/locate_home_base/src/Front_10m.png";
#define BACK_TRAIN5 = "./src/locate_home_base/src/Back_5m.png";
#define BACK_TRAIN10 = "./src/locate_home_base/src/Back_10m.png";
*/

#endif /* HOMEBASE_HPP_ */
