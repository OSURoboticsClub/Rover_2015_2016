#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>

/* run this file once with 'rosrun locate_home_base compute' to generate 
 * constants for the location code. Add new pictures and find constants if not
 * using the ZED camera, otherwise this file does not need to run
 */

//header file contains a series of constants that could probably be cleaned up
#include "HomeBase.h"

/* there is a mix of namespaces used/omitted since this is a combination of ROS 
opencv tutorial code and code written for the 2015 rover */
using namespace cv;


// gets the distance between two points
float dist(Point2f p1, Point2f p2)
{
	float dist = sqrt(pow((p2.x - p1.x), 2) + pow((p2.y - p1.y), 2));
	return(dist);
}

// find outer corners of a checkerboard base on the detected list of corners and known board size
vector<Point2f> getCorners(vector<vector<Point2f> >imagePoints, Size boardSize)
{
	vector<Point2f> corners(4);
	corners[0] = imagePoints[0][0];
	corners[1] = imagePoints[0][boardSize.width-1];
	corners[2] = imagePoints[0][(boardSize.width * (boardSize.height-1))];
	corners[3] = imagePoints[0][(boardSize.width * (boardSize.height)) -1];
	return corners;
}

// get the distance between the four corners found by  the above funciton
vector<float> getPixDist(vector<Point2f> corners)
{
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

// compute the focal for the board (see training function)
vector<float> computeFocal(int side, vector<float> pixDist, float D){
	//F = (P x  D) / W
	//float D = TRAIN_DIST; //train distance 22 inches or 558.8mm
	float Wh, Wv;
	if(side == FRONT)
	{
		Wh = FRONT_SZIE * (FRONT_COLS-1); //width of 4 squares (50.8mm) each
		Wv = FRONT_SZIE * (FRONT_ROWS-1); //width of 3 squares (50.8mm) each
	} 
	else
	{
		Wh = BACK_SZIE * (BACK_COLS-1); //width of 4 squares (50.8mm) each
		Wv = BACK_SZIE * (BACK_ROWS-1); //width of 3 squares (50.8mm) each
	}

	// take the calculated board perimeter from an image in pixels, mult by D our known board distance (5k or 10k mm, divide by pixel distance on board to get a distance estimate, then average both sides 
	float Fh1 = (pixDist[0] * D) / Wh;
	float Fh2 = (pixDist[1] * D) / Wh;
	float Fv1 = (pixDist[2] * D) / Wv;
	float Fv2 = (pixDist[3] * D) / Wv;
	float Fh  = (Fh1 + Fh2) / 2;
	float Fv  = (Fv1 + Fv2) / 2;

	vector<float> focal(2);
	focal[0] = Fh;
	focal[1] = Fv;
	return focal;
}

vector<float> trainDistance(int side, Size boardSize)
{
	Mat image5, image10;
	if(side == FRONT)
	{
		image5 = imread("src/locate_home_base/src/Front_5m.jpg"); //read in trained image file
		
		image10 = imread("src/locate_home_base/src/Front_10m.jpg"); //read in trained image file
		if (image5.empty() || image10.empty()) 
		{
			std::cout << "Could not find a front training image\n";
			exit(0);
		}
	} 	
	else 
	{
		image5 = imread("src/locate_home_base/src/Back_5m.jpg"); //read in trained image file
		image10 = imread("src/locate_home_base/src/Back_10m.jpg"); //read in trained image file
		
		if (image5.empty() || image10.empty()) 
		{
			std::cout << "Could not find a back training image\n";
			exit(0);
		}
	}

	vector<vector<Point2f> > imagePoints5(1), imagePoints10(1);
	bool found5 = findChessboardCorners(image5, boardSize, imagePoints5[0]);
	bool found10 = findChessboardCorners(image10, boardSize, imagePoints10[0]);
	
	if(!(found5 && found10))
	{
		std::cout << "No boards detected in training\n";
		return vector<float>();
	}
	
	vector<Point2f> corners5 = getCorners(imagePoints5, boardSize);
	vector<Point2f> corners10 = getCorners(imagePoints10, boardSize);
	vector<float> pix_dist5 = getPixDist(corners5);
	vector<float> pix_dist10 = getPixDist(corners10);
	vector<float> focal5 = computeFocal(side, pix_dist5, TRAIN_DIST5);
	vector<float> focal10 = computeFocal(side, pix_dist10, TRAIN_DIST10);
	vector<float> focal(2);
	
	focal[0] = (focal5[0] + focal10[0])/2;
	focal[1] = (focal5[1] + focal10[1])/2;
	return focal;
}

int main(int argc, char** argv)
{
	Size frontSize = Size(FRONT_COLS,FRONT_ROWS);
	Size backSize = Size(BACK_COLS,BACK_ROWS);

	vector<float> focalf = trainDistance(FRONT, frontSize);
	vector<float> focalb = trainDistance(BACK, backSize);
		
	std::cout << "focalf horiz: " << focalf[0] << "focalf vert: " << focalf[1]; 
	std::cout << "focalb horiz: " << focalb[0] << "focalb vert: " << focalb[1];
}

