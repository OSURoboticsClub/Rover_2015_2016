/*
 * HomeBase.h
 *
 *  Created on: May 1, 2015
 *      Author: scott
 *
 *	Modified April 2016
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

#endif /* HOMEBASE_HPP_ */
