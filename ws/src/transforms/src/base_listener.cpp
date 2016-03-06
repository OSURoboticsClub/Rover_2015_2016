#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include <tf/transform_listener.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <sensor_msgs/PointCloud2.h>
#include <pcl/common/io.h>
#include <pcl_conversions/pcl_conversions.h>
#include "pcl_ros/transforms.h"
#include "pcl_ros/impl/transforms.hpp"
#include <string>

tf::TransformListener *listener = NULL; 
//tf::TransformListener listener;
ros::Publisher pc2_tf_pub;
const std::string base = "base_link";

void cameraPc2Callback(const sensor_msgs::PointCloud2::ConstPtr& pc2_in)
{
	// our transformed value
	sensor_msgs::PointCloud2 pc2_out;
	tf::StampedTransform transform;

	try
	{
		listener->waitForTransform("base_link", "camera_link", (*pc2_in).header.stamp, ros::Duration(3.0));
		listener->lookupTransform("base_link", "camera_link", (*pc2_in).header.stamp, transform);
	}
	catch(tf::TransformException ex) 
	{
		ROS_ERROR("%s",ex.what());
	}

	pcl_ros::transformPointCloud("base_link", *pc2_in,  pc2_out, *listener);

	// publish a transformed cloud 
	pc2_tf_pub.publish(pc2_out);
}
	
int main(int argc, char** argv){
	ros::init(argc, argv, "cam_tf_base_pc2");
	ros::NodeHandle n;

	listener = new (tf::TransformListener);

	tf::TransformListener listener;//(ros::Duration(10));
	ros::Subscriber pc2_sub = n.subscribe<sensor_msgs::PointCloud2>("/camera/point_cloud/cloud", 1000, cameraPc2Callback);
	pc2_tf_pub = n.advertise<sensor_msgs::PointCloud2>("base_pc2", 1000);

	ros::spin();
}
