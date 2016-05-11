#include <ros/ros.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <actionlib/client/simple_action_client.h>
#include <tf/transform_listener.h>

typedef actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> MoveBaseClient;

struct pos2d
{
	float x;
	float y;
};

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

int main(int argc, char** argv){
	ros::init(argc, argv, "simple_navigation_goals");

	// node handle to listen in on transforms
	ros::NodeHandle n;

	//tell the action client that we want to spin a thread
	MoveBaseClient ac("move_base", true);

	move_base_msgs::MoveBaseGoal goal;
	struct pos2d posSet, posEnd;

	//wait for the action server to come up
 	while(!ac.waitForServer(ros::Duration(5.0))){
		ROS_INFO("Waiting for the move_base action server to come up");
	}

// GOAL (still set for bag 4 from old tests)
	posSet.x = 13;
	posSet.y = 3;

	goal = createGoal(posSet, 1);

  	ROS_INFO("Sending goal");
  	ac.sendGoal(goal);

	// wait for result or time out after 60s 
  	bool finished_before_timeout = ac.waitForResult(ros::Duration(60.0));
	
	// get pos after goal met or time out
	posEnd = getCurrentPos();
	
	if (finished_before_timeout)
  	{
    		//ROS_INFO("Action finished: %s",ac.getState.toString().c_str());
		if(ac.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
   	 		ROS_INFO("Goal met!");
  		else
   			ROS_INFO("Goal failed");
  	}
  	else
		ROS_INFO("Action did not finish before the time out.");
	
	return 0;
}
