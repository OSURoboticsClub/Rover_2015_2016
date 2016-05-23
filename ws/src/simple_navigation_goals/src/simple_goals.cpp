#include <ros/ros.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <actionlib/client/simple_action_client.h>
#include <tf/transform_listener.h>
#include "locate_home_base/locate_base.h"
#include "../../locate_home_base/src/HomeBase.h"
#include <cmath>
#include <Python.h>

#define PI 3.14159265

typedef actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> MoveBaseClient;

struct pos2d
{
	float x;
	float y;
	float w;
};

struct boardPos
{
	float x;
	float y;
};

/* this array will define the planned stops for the rover over level 1
{x, y, w} represent ending x pos in meters, ending y pos in meters, ending orientation in radians
*/
//			 easy sample	      pre cached	 within checkerboard range
pos2d plannedStops[3] = {{6.0, 15.88, PI/2}, {33.58, 16.29, 0}, {16, 3, PI}};

/* getCurrentPos logs and returns current x,y position of the robot in the map frame
Returns: pos struct
*/
struct pos2d getCurrentPos(void)
{
	tf::TransformListener listener;
	tf::StampedTransform transform;
	pos2d pos;
    	try
    	{
        	ROS_INFO("getCur2d: Looking up 2D POS");
		ros::Time current = ros::Time(0);
		listener.waitForTransform("/map", "/base_link", current, ros::Duration(3.0));
        	listener.lookupTransform("/map","/base_link", current, transform);

		pos.x = transform.getOrigin().x();
		pos.y = transform.getOrigin().y(); 
		pos.w = tf::getYaw(transform.getRotation());
		ROS_INFO("x: %f, y: %f, w: %f",pos.x, pos.y, pos.w);       
		return (pos);
        }
    	catch (tf::TransformException ex)
    	{
		pos.x = -1;
		pos.y = -1;
		pos.w = -1;
		ROS_INFO("getCur2d: tf lookup failed");
		return (pos);
    	} 
}

/* create goal takes pos2d position 
sets and returns MoveBaseGoal
*/
move_base_msgs::MoveBaseGoal createGoal(struct pos2d pos)
{
	move_base_msgs::MoveBaseGoal goal;
	pos2d curPos = getCurrentPos();
	struct pos2d target = pos;

	// goal header
  	goal.target_pose.header.frame_id = "map";
  	goal.target_pose.header.stamp = ros::Time::now();
	
	// convert global position to relitive position for sending goals
	target.x = pos.x - curPos.x;
	target.y = pos.y - curPos.y;

	// set goal
  	goal.target_pose.pose.position.x = pos.x;
	goal.target_pose.pose.position.y = pos.y;
  	goal.target_pose.pose.orientation.w = tf::createQuaternionMsgFromYaw(pos.w).w; // pos.w is in radians;

	// print target goal
	ROS_INFO("x: %f, y: %f, w: %f",goal.target_pose.pose.position.x, goal.target_pose.pose.position.y, goal.target_pose.pose.orientation.w); 

	return goal;
}

/* executeGoal takes a goal, pointer to a client, and a timeout value and runs the goal
timeout value should be longer than the time to achieve the goal
goal can be created with a goal to createGoal
*/
bool executeGoal(move_base_msgs::MoveBaseGoal goal, MoveBaseClient *client, int timeout)
{
	ROS_INFO("Sending goal");
  	client->sendGoal(goal);

	// wait for result or time out after 60s 
  	bool finished_before_timeout = client->waitForResult(ros::Duration(timeout));
	
	// check goal outcome
	if (finished_before_timeout)
  	{
		if(client->getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
		{
			ROS_INFO("executeGoal: goal met");
			//ros::param::set("/base_goal_param", true);
			return(true);
		}
  		else
		{
			ROS_INFO("executeGoal: missed goal");
			//ros::param::set("/base_goal_param", false);
			return(false);
		}
  	}
  	else
	{
		ROS_INFO("executeGoal: time out");
		//ros::param::set("/base_goal_param", false);
		return(false);
	}
}

/* getCurrentPosFrom.. returns current x,y position of the robot with respect to the home beacon
ie, if home beacon set to (3,3) as it has been for testing, a return value of (10,5) means the 
rover is really at (13,8), similaraly (10,-1) would be (13,2)
*/ 
struct boardPos getCurrentPosFromCheckboard(ros::ServiceClient client)
{
	float base_distance, base_angle;
	locate_home_base::locate_base srv;
	struct boardPos coord;
	
	// service is set to have a request data and return data field, our request just has the time it was sent
	srv.request.header.stamp = ros::Time::now();

	if (client.call(srv))
	{
		base_distance = (float)srv.response.distance;
		base_angle = (float)srv.response.angle;

		if (base_distance == CANT_FIND)
		{ 
			ROS_ERROR("getCur2dCheck: Couldn't see checkerboard");
			coord.x = -1;
			coord.y = -1;
		}
		else
		{	
			// convert angle and distance to x,y from base station
			ROS_INFO("getCur2dCheck: Checkerboard detected");	
			coord.x = base_distance*cos(abs(base_angle) * PI / 180.0)/1000;		
			if (base_angle < 0)
				coord.y =  -base_distance*sin(abs(base_angle) * PI / 180.0)/1000;
			else 
				coord.y =  base_distance*sin(abs(base_angle) * PI / 180.0)/1000;
			ROS_INFO_STREAM("X: "<<coord.x<<" Y: "<<coord.y);	
		}
  	}
  	else
  	{
    		ROS_ERROR("getCur2dCheck: Failed to call service locate_base");
		coord.x = -1;
		coord.y = -1;
  	}
	
	return coord;
}

// TODO: WRITE THIS
bool recovery(move_base_msgs::MoveBaseGoal goal, MoveBaseClient *client, int timeout)
{
	struct pos2d curPos;
	ROS_INFO("executeGoal: time out");

	// get estimated location from odom
	curPos = getCurrentPos();
	// 
	float xDelta = curPos.x;
	float yDelta = curPos.y;

	return (true);
}

/* base_goal value will be grab node trigger 
When false, moving to goal
When true, goal has been met and grab can take over
*/
void toggleParam(bool setting)
{
	ros::param::set("/base_goal_param", setting);
}

bool waitForToggle(void)
{
	bool control;
	ros::param::get("/base_goal_param", control);
	
	while (control == true)
	{
		ROS_INFO("waitingForToggle: Waiting for param to become false again");
		ros::Duration(5.0).sleep();
		ros::param::get("/base_goal_param", control);
		if (control == false)
		{
			break;
		}	
	}
	return false;
}

int main(int argc, char** argv){
	ros::init(argc, argv, "simple_navigation_goals");
	
	// node handle to communication with service from locate base
	ros::NodeHandle nsrv; 
	ros::ServiceClient client = nsrv.serviceClient<locate_home_base::locate_base>("locate_base");
	
	// set ros param for grab node communication
	ROS_INFO("Main: Setting to false");
	toggleParam(false);

	//tell the action client that we want to spin a thread
	MoveBaseClient ac("move_base", true);

	move_base_msgs::MoveBaseGoal goal;
	struct pos2d pos;
	struct boardPos home;
	bool goalOutcome;
	goal = createGoal(plannedStops[0]);
	//wait for the action server to come up
 	while(!ac.waitForServer(ros::Duration(5.0))){
		ROS_INFO("Main: Waiting for the move_base action server to come up");
	}
	
	for (int i = 0; i < sizeof(plannedStops)/sizeof(struct pos2d); i++)
	{
		goal = createGoal(plannedStops[i]);
		if (executeGoal(goal, &ac, 60) == true)	
		{
			// transfer control
			toggleParam(true);
			waitForToggle();
		}
		else
		{
			//recovery
		}		
	}

	home = getCurrentPosFromCheckboard(client); 
	
	if (home.x != -1 && home.y != -1)
	{
		// we got valid coordinates, now we create the final goal
		pos.x = -home.x;
		pos.y = -home.y;
		pos.w = PI; // facing checkerboard

		goal = createGoal(pos);
		if (executeGoal(goal, &ac, 60) == true)	
		{
			// end program
  		/*	Py_Initialize();
  			PyRun_SimpleString("import sys");
			PyRun_SimpleString('sys.path.append("~/home/Desktop/repo/Rover2016/ws/src/simple_navigation_goals/src/stopRover")');
  			Py_Finalize();*/
		}
	}
	else
	{
		// home base recovery
	}	
	return 0;
}
