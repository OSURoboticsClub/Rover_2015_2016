#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
#include "locate_home_base/locate_base.h"
//header file contains a series of constants that could probably be cleaned up
#include "HomeBase.h"

/* there is a mix of namespaces used/omitted since this is a combination of ROS 
opencv tutorial code/code written for the 2015 rover/updates to add publishing/subscribing/service */
using namespace cv;
using namespace std;

// this come from the compute constants file, only needs to be used once to calibrate a camera
vector<float> focalf(2);
vector<float> focalb(2);

/* 
This class is from a ROS sample, will translate the ROS message to opencv type, 
process the video feed, and publish it. 

The publishing and subscibing that happen in the class are now wrapped by a ros service.

The class is initialized in the service and callback exicuted once. Once the callback completes the service sends of to answer the request. 
Further requests cause the class to re-instantiate and run another single callback.
*/

class ImageConverter
{
	// gets the distance between two points
	float dist(Point2f p1, Point2f p2){
		float dist = sqrt(pow((p2.x - p1.x), 2) + pow((p2.y - p1.y), 2));
		return(dist);
	}

	// find outer corners of a checkerboard base on the detected list of corners and known board size
	vector<Point2f> getCorners(vector<vector<Point2f> >imagePoints, Size boardSize){
		vector<Point2f> corners(4);
		corners[0] = imagePoints[0][0];
		corners[1] = imagePoints[0][boardSize.width-1];
		corners[2] = imagePoints[0][(boardSize.width * (boardSize.height-1))];
		corners[3] = imagePoints[0][(boardSize.width * (boardSize.height)) -1];
		return corners;
	}

	// get the distance between the four corners found by  the above funciton
	vector<float> getPixDist(vector<Point2f> corners){
		vector<float> dists(4);
		Point2f tl = corners[0];
		Point2f tr = corners[1];
		Point2f bl = corners[2];
		Point2f br = corners[3];

		float h1 = dist(tl, tr);
		float h2 = dist(bl, br);
		float v1 = dist(tl, bl);
		float v2 = dist(tr, br);

		dists[0] = h1;
		dists[1] = h2;
		dists[2] = v1;
		dists[3] = v2;

		return dists;
	}

	// compute the distance to the detected side (I believe)
	float computeDistance(int side, vector<float> pixDist, vector<float> focal){
		//D = (W x F) / P

		float Wh, Wv;
		if(side == FRONT){
			Wh = FRONT_SZIE * (FRONT_COLS-1);
			Wv = FRONT_SZIE * (FRONT_ROWS-1);
		} else {
			Wh = BACK_SZIE * (BACK_COLS-1);
			Wv = BACK_SZIE * (BACK_ROWS-1);
		}

		//ROS_INFO_STREAM("Wh = " << Wh << "focal[0] = " << focal[0] << "pixD[0] = " << pixDist[0]);
		float Dh1 = (Wh * focal[0]) / pixDist[0];
		float Dh2 = (Wh * focal[0]) / pixDist[1];
		float Dv1 = (Wv * focal[1]) / pixDist[2];
		float Dv2 = (Wv * focal[1]) / pixDist[3];
		float D = (Dh1 + Dh2 + Dv1 + Dv2) / 4;
		return D;
	}

	/*
	 *  Given two vertices, finds the vertical angle of the
	 *  top vertex with respect to the bottom (bottom = center/pivot).
	 *  @return value of range [-90, 90],
	 *          positive angle is clockwise tilt,
	 *          negative angle is counter-clockwise tilt
	 *      - * +	
	 *    *   |   *
	 *    -   |   +
	 *        |
	 *        *
	 */
	// p1: bottom right p2: top right
	float findTilt(Point2f p1, Point2f p2)
	{
		Point2f top, bot;
		//y pixel increases downwards
		if (p1.y > p2.y) 
		{
			top = p2;
			bot = p1;
		} 
		else if (p1.y < p2.y) 
		{
			top = p1;
			bot = p2;
		} 
		else 
		{
			if (p1.x > p2.x) {
				return -90;
			} else if (p1.x < p2.x) {
				return 90;
			} else {
				return 0;
			}
		}

		int delta_x, delta_y;
		float theta;
		delta_x = top.x - bot.x;
		delta_y = bot.y - top.y; 
		theta = atan(delta_x / delta_y);
		return theta;
	}

	/*
	 *  This function calculate angle of orientation (yaw) using trigonometric methods
	 *  Assumptions: the four corner vertices create a parallelogram, thus we are
	 *               using only one of the sides for calculating tilt
	 */
	float
	findOrientation(vector<Point2f> corners, int rows, int cols)
	{
		bool ERROR = false;
		int tilt;

		Point2f top_left = corners[0];
		Point2f top_right = corners[1];
		Point2f bot_left = corners[2];
		Point2f bot_right = corners[3];

		float theta = findTilt(bot_right, top_right);
		if (theta > TILT_THRESH) 
		{
			ERROR = true;
			tilt = theta; //set global
			return 0;
		} 
		else 
		{
			ERROR = false;
		}

		// fix needed: rearrange if board is upside down
		float delta_y;
		delta_y = bot_right.y - top_right.y;
		float r_len = delta_y / cos(theta);
		delta_y = bot_left.y - top_left.y;
		float l_len = delta_y / cos(theta);

		float ratio = l_len / r_len;  //ratio (left : right)
		float orientation = (1 - ratio) * 264; //264 based on my testing
		return orientation;
	}

	vector<float> detectBoard(Mat &image, int side, Size boardSize, vector<float> focal){
		vector<float> board(2);

		if(image.empty())
			 exit (EXIT_FAILURE); // Replaced break that didn't build, this may not be safe

		// Find the chessboard corners
		vector<vector<Point2f> > imagePoints(1);
		bool found = findChessboardCorners(image, boardSize, imagePoints[0]); //,CALIB_CB_FAST_CHECK); to increase function speed with loss of accuracy

		if(!found)
		{
			cerr << "HOME BASE SUBSCRIBER: Could not find chess board!" << endl;
			board[0] = CANT_FIND;
			return board;
		}
		else 
		{
			vector<Point2f> corners = getCorners(imagePoints, boardSize);
			vector<float> pix_dist = getPixDist(corners);
			float D = computeDistance(side, pix_dist, focal);
			float angle;
			if(side = FRONT)
			{
				angle = findOrientation(corners, FRONT_ROWS, FRONT_COLS);
			} 
			else 
			{
				angle = findOrientation(corners, BACK_ROWS, BACK_COLS);
			}
			board[0] = D;
			board[1] = angle; //this should be the angle of the board
		}

		return board;
	}

	void locateChessboard(Mat& image)
	{
		Size frontSize = Size(FRONT_COLS,FRONT_ROWS);
		Size backSize = Size(BACK_COLS,BACK_ROWS);

		// these come from the focal constants file and are camera dependent
		focalf[0] = 685.623;
		focalf[1] = 698.095;

		focalb[0] = 673.716;
		focalb[1] = 674.715;

		//float distance, angle;
		int side = 0;
			
			// detection here is flawed
			// the front is a 6x4 grid while back is 5x4. Since the chessboard function uses the inner corners, 
			// the back can be detected within either side of the poster
			// the front and back grids are different sizes so calibration will be incorrect if back is detected from the front

			// Might as well use just the back since we arent worried about any direction of apporach right now

		/*	vector<float> board = detectBoard(image, FRONT, frontSize, focalf);
			if(board[0] == CANT_FIND)
			{
				board = detectBoard(image, BACK, backSize, focalb);
				side = BACK;
			} 
			else 
			{
				side = FRONT;
			} */
		
			vector<float> board = detectBoard(image, BACK, backSize, focalb);

			base_distance = board[0];
			base_angle = board[1];

			ROS_INFO_STREAM("HOME BASE SUBSCRIBER: Distance: " << board[0] << " Angle: " << board[1]);
	}

public:
	ros::NodeHandle nh_;
	image_transport::ImageTransport it_;
	image_transport::Subscriber image_sub_;
	
	// these values store our angle and distance returned by the class functions
	float base_distance = CANT_FIND;
	float base_angle = 0.0;
	
	// flag to let the locator service know we have entered the subscription callback
	int avail = 1;

	ImageConverter( ) 
	: it_(nh_)
	{	

		// Subscribe to input video feed and publish output video feed
		image_sub_ = it_.subscribe("/camera/rgb/image_rect_color", 1, &ImageConverter::imageCb, this);
		
		ROS_INFO("HOME BASE SUBSCRIBER: Initialized");

		//cv::namedWindow(OPENCV_WINDOW);
	}

	void imageCb(const sensor_msgs::ImageConstPtr& msg)
	{
		ROS_INFO("HOME BASE SUBSCRIBER: callback");
				
		cv_bridge::CvImagePtr cv_ptr;
		try
		{
			cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
		}
		catch (cv_bridge::Exception& e)
		{
			ROS_ERROR("HOME BASE SUBSCRIBER: cv_bridge exception in callback: %s", e.what());
			return;
		}
		
		// where we can do openCV work
		locateChessboard(cv_ptr->image);
		avail = 0;
	}
};

bool locator(locate_home_base::locate_base::Request  &req, locate_home_base::locate_base::Response &res)
{
	ImageConverter ic; 
	// runs with spin once to ensure that an image has been grabbed in the subscriber

	while (ic.avail != 0)
	{
		ROS_INFO("LOCATOR SERVICE: Waiting on ZED");
		ros::Duration(0.1).sleep();
		ros::spinOnce();
	}
	ROS_INFO("LOCATOR SERVICE: sending back response");

	res.distance = ic.base_distance;
	res.angle = ic.base_angle;
  	return true;
}

int main(int argc, char** argv)
{
	ros::init(argc, argv, "image_converter");
	ros::NodeHandle server_nh;
	ros::ServiceServer service = server_nh.advertiseService("locate_base", locator);
	ros::spin();
	return 0;
}
