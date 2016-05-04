#include <ros/ros.h>
#include <tf/transform_broadcaster.h>

int main(int argc, char** argv){
	ros::init(argc, argv, "robot_tf_publisher");
	ros::NodeHandle n;

	ros::Rate r(100);

 	tf::TransformBroadcaster base_broadcaster;
	//tf::TransformBroadcaster odom_link;
	tf::TransformBroadcaster map_link;
	tf::Transform transform;

  	while(n.ok()){
	// tf::Quat represents rotation 
	// tf::Vect represents the translation corresponding to the zed offset from the rovers base in meters
	// timestamp is set to now
	// parent node created is base link, child node camera_link
	transform.setOrigin( tf::Vector3(0.0, 0.0, 0.0) );
        transform.setRotation( tf::Quaternion(1, -1, 1, 1) );
       	base_broadcaster.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "base_link", "camera_link"));

/*	transform.setOrigin( tf::Vector3(3.0, 3.0, 0.0) );
        transform.setRotation( tf::Quaternion(0, 0, 0, 1) );
        odom_link.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "odom", "base_link")); */

	transform.setOrigin( tf::Vector3(3.0, 3.0, 0.0) );
        transform.setRotation( tf::Quaternion(0, 0, 0, 1) );
        map_link.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "map", "odom"));
/*
   		base_broadcaster.sendTransform(
 		 tf::StampedTransform(
		  tf::Transform(tf::Quaternion( 0, -1, 0, 1), tf::Vector3(0.1, 0.0, 1.0)), 	
		  ros::Time::now(),"base_link", "camera_link"));
    		//odom to base
		odom_link.sendTransform(
		 tf::StampedTransform(
		  tf::Transform(tf::Quaternion( 0, 0, 0, 1), tf::Vector3(0.0, 0.0, 0.0)), 	
		  ros::Time::now(),"odom", "base_link"));
		r.sleep();
		//map to odom
		map_link.sendTransform(
		 tf::StampedTransform(
		  tf::Transform(tf::Quaternion( 0, 0, 0, 1), tf::Vector3(0.0, 0.0, 0.0)),
		  ros::Time::now(),"map", "odom"));
*/
		r.sleep();
  	}
return 0;
}

