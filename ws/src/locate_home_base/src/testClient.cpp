#include "ros/ros.h"
#include "locate_home_base/locate_base.h"
#include <cstdlib>

/* simple test to call the locate service */
int main(int argc, char **argv)
{
  ros::init(argc, argv, "base_client");

  ros::NodeHandle n;
  ros::ServiceClient client = n.serviceClient<locate_home_base::locate_base>("locate_base");
  locate_home_base::locate_base srv;
  srv.request.header.stamp = ros::Time::now();
  
  if (client.call(srv))
  {
    ROS_INFO("Sum: %f", (float)srv.response.distance);
    ROS_INFO("Sum: %f", (float)srv.response.angle);
  }
  else
  {
    ROS_ERROR("Failed to call service locate_base");
    return 1;
  }

  return 0;
}
