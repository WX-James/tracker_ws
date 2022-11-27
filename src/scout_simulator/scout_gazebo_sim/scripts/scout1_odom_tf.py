#!/usr/bin/env python

import os
import numpy as np
from math import cos, sin

from geometry_msgs.msg import PoseStamped, TwistStamped
from nav_msgs.msg import Odometry 

from gazebo_msgs.msg import ModelStates, LinkStates

import tf
import rospy

class vehicle_pose_and_velocity_updater:
	def __init__(self):
		rospy.init_node('scout_odom_tf', log_level=rospy.DEBUG)

		self.odom_pub = rospy.Publisher('/state_ukf/odom1', Odometry, queue_size = 1)
		rospy.Subscriber('/gazebo/model_states', ModelStates, self.model_cb, queue_size = 1)
		self.timer = rospy.Timer(rospy.Duration(0.01), self.pubModelstate)
		self.odom_ = Odometry()
		rospy.spin()

	def model_cb(self,data):
		try:
			# vehicle_model_index = data.name.index("scout/")
			vehicle_model_index = data.name.index("scout/robot1")
		except:
			return
		vehicle_position = data.pose[vehicle_model_index]
		vehicle_velocity = data.twist[vehicle_model_index]
		orientation = vehicle_position.orientation
		(_, _, yaw) = tf.transformations.euler_from_quaternion([orientation.x,orientation.y,orientation.z,orientation.w])
		time_stamp = rospy.Time.now()

		# vehicle Odometry msgs
		self.odom_.header.frame_id = 'odom1'
		self.odom_.header.stamp = time_stamp
		self.odom_.pose.pose.position = vehicle_position.position
		self.odom_.pose.pose.orientation = vehicle_position.orientation
		self.odom_.twist.twist.linear = vehicle_velocity.linear
		self.odom_.twist.twist.angular = vehicle_velocity.angular


	def pubModelstate(self, timer):
		self.odom_pub.publish(self.odom_)
		br = tf.TransformBroadcaster()
		br.sendTransform((self.odom_.pose.pose.position.x, self.odom_.pose.pose.position.y, self.odom_.pose.pose.position.z),
						(self.odom_.pose.pose.orientation.x, self.odom_.pose.pose.orientation.y, self.odom_.pose.pose.orientation.z, self.odom_.pose.pose.orientation.w),
						rospy.Time.now(),
						'robot1/base_link',
						"odom1")

if __name__ == "__main__":
	try:
		vehicle_pose_and_velocity_updater()
	except:
		rospy.logwarn("cannot start vehicle odom and tf updater")