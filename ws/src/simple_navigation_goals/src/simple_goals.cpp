#include <ros/ros.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <actionlib/client/simple_action_client.h>
#include <tf/transform_listener.h>
#include "locate_home_base/locate_base.h"
#include "../../locate_home_base/src/HomeBase.h"
#include <cmath>

#define PI 3.14159265

typedef actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> MoveBaseClient;

struct pos2d
{
	float x;
	float y;
};

// this array will define the planned stops for the rover over level 1
pos2d level1Stops[3] = {{6,3}, {6,12}, {1,1}};

/* create goal takes (x,y) position and a z angle
Returns: MoveBaseGoal
z = 1 is straight ahead
*/
move_base_msgs::MoveBaseGoal createGoal(struct pos2d pos, float z)
{
	move_base_msgs::MoveBaseGoal goal;
	
	// goal header
  	goal.target_pose.header.frame_id = "map";
  	goal.target_pose.header.stamp = ros::Time::now();
	
	// set goal
  	goal.target_pose.pose.position.x = pos.x;
	goal.target_pose.pose.position.y = pos.y;
  	goal.target_pose.pose.orientation.w = z;

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
			ROS_INFO("MOVE BASE: goal met");
			//ros::param::set("/base_goal_param", true);
			return(true);
		}
  		else
		{
			ROS_INFO("MOVE BASE: missed goal");
			//ros::param::set("/base_goal_param", false);
			return(false);
		}
  	}
  	else
	{
		ROS_INFO("MOVE BASE: time out");
		//ros::param::set("/base_goal_param", false);
		return(false);
	}
}

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
        	ROS_INFO("Looking up 2D POS");
		ros::Time current = ros::Time(0);
		listener.waitForTransform("/map", "/base_link", current, ros::Duration(3.0));
        	listener.lookupTransform("/map","/base_link", current, transform);

		pos.x = transform.getOrigin().x();
		pos.y = transform.getOrigin().y(); 
		ROS_INFO("x: %f, y: %f",pos.x, pos.y);       
		return (pos);
        }
    	catch (tf::TransformException ex)
    	{
		pos.x = -1;
		pos.y = -1;
		ROS_INFO("tf lookup failed");
		return (pos);
    	} 
}

struct pos2d getCurrentPosFromCheckboard(ros::ServiceClient client)
{
	float base_distance, base_angle;
	locate_home_base::locate_base srv;
	struct pos2d coord;

	srv.request.header.stamp = ros::Time::now();

	if (client.call(srv))
	{
		base_distance = (float)srv.response.distance;
		base_angle = (float)srv.response.angle;

		if (base_distance == CANT_FIND)
		{ 
			ROS_ERROR("Couldn't see checkerboard");
			coord.x = -1;
			coord.y = -1;
		}
		else
		{	
			// convert angle and distance to x,y from base station
			ROS_INFO("Checkerboard detected");	
			coord.x =  base_distance*cos(abs(base_angle) * PI / 180.0)/1000;		
			if (base_angle < 0)
				coord.y =  -base_distance*sin(abs(base_angle) * PI / 180.0)/1000;
			else 
				coord.y =  base_distance*sin(abs(base_angle) * PI / 180.0)/1000;
			ROS_INFO_STREAM("X: "<<posEnd.x<<" Y: "<<posEnd.y);	
		}
  	}
  	else
  	{
    		ROS_ERROR("Failed to call service locate_base");
		coord.x = -1;
		coord.y = -1;
  	}
	
	return coord;
}

int main(int argc, char** argv){
	ros::init(argc, argv, "simple_navigation_goals");

	// node handle to communication with service from locate base
	ros::NodeHandle nsrv; 
	ros::ServiceClient client = nsrv.serviceClient<locate_home_base::locate_base>("locate_base");

	// base goal param can be queried by nodes to pass control
	// false is set until a goal is met
	ros::param::set("/base_goal_param", false);

	//tell the action client that we want to spin a thread
	MoveBaseClient ac("move_base", true);

	move_base_msgs::MoveBaseGoal goal;
	struct pos2d posEnd;
	bool goalOutcome;
	
	//wait for the action server to come up
 	while(!ac.waitForServer(ros::Duration(5.0))){
		ROS_INFO("Waiting for the move_base action server to come up");
	}
	
	for (int i = 0; i < sizeof(level1Stops)/sizeof(struct pos2d); i++)
	{
		goal = createGoal(level1Stops[i], 1);
		goalOutcome = executeGoal(goal, &ac, 60);
		//recovery
		//transfer control
	}

	// look for checkboard and create final goal
	return 0;
}
