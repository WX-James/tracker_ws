#include <ros/ros.h>
#include <Eigen/Eigen>
#include <deque>

#include "nav_msgs/Odometry.h"
#include "tf/transform_datatypes.h"

#include "mpc/Polynome.h"                   // 自定义消息
#include "std_msgs/Float32MultiArray.h"

#define delta_t 0.05
#define traj_size 10
#define hold_dist 2.0

#define max_traj_point 10
#define min_traj_point 5

ros::Publisher traj_pub_lmpc;
ros::Publisher traj_pub_nmpc;

nav_msgs::Odometry target_odom;
nav_msgs::Odometry robot_odom;

enum TRACKER_TYPE { STOP = 1, FOLLOW = 2};

bool is_rcv_target_odom = false;
bool is_rcv_robot_odom = false;

void odom1Callbck(const nav_msgs::Odometry& msg) 
{
    if (msg.child_frame_id == "X" || msg.child_frame_id == "O") return;
    is_rcv_robot_odom = true;
    robot_odom = msg;
}

void odom2Callbck(const nav_msgs::Odometry& msg) 
{

    if (msg.child_frame_id == "X" || msg.child_frame_id == "O") return;
    is_rcv_target_odom = true;
    target_odom = msg;

}

Eigen::Vector3d odom2vector(nav_msgs::Odometry odom)
{
    Eigen::Vector3d pos;
    pos << odom.pose.pose.position.x, odom.pose.pose.position.y, odom.pose.pose.position.z;
    return pos;
}

double get_yaw(nav_msgs::Odometry odom)
{
    tf::Quaternion quat;
    tf::quaternionMsgToTF(odom.pose.pose.orientation, quat);

    double roll, pitch, yaw;
    tf::Matrix3x3(quat).getRPY(roll, pitch, yaw); //四元数转rpy
    return yaw;
}

double calc_distance(nav_msgs::Odometry target, nav_msgs::Odometry agent)
{
    double distance;
    Eigen::Vector3d target_pos, agent_pos;

    target_pos = odom2vector(target);
    agent_pos = odom2vector(agent);

    distance = (target_pos - agent_pos).norm();

    return distance;
}

void pub_traj_lmpc(nav_msgs::Odometry odom_traj)
{
    mpc::Polynome poly;
    geometry_msgs::Point temp;
    
    for(int i = 0; i < traj_size; i++)
    {
        // 发布重复的位置点
        temp.x = odom_traj.pose.pose.position.x;
        temp.y = odom_traj.pose.pose.position.y;
        temp.z = odom_traj.pose.pose.position.z;
        poly.pos_pts.push_back(temp);
    }
    for (int i = 0; i < traj_size - 1; i++)
    {
        // 发布均匀的间隔时间
        poly.t_pts.push_back(delta_t);
    }

    poly.init_v.x = 0;  // 速度和加速度置零
    poly.init_v.y = 0;
    poly.init_v.z = 0;
    poly.init_a.x = 0;
    poly.init_a.y = 0;
    poly.init_a.z = 0;
    poly.start_time = ros::Time::now();

    traj_pub_lmpc.publish(poly);
}

void pub_traj_nmpc(nav_msgs::Odometry odom_traj)
{
    std_msgs::Float32MultiArray waypoint_array;

    for(int i = 0; i < traj_size; i++)
    {
        double target_yaw = get_yaw(odom_traj);

        waypoint_array.data.push_back(odom_traj.pose.pose.position.x);
        waypoint_array.data.push_back(odom_traj.pose.pose.position.y);
        waypoint_array.data.push_back(target_yaw);
    }
    traj_pub_nmpc.publish(waypoint_array);
}

void stateCallback(const ros::TimerEvent& e) 
{
    if((!is_rcv_robot_odom) || (!is_rcv_target_odom)) return;   // 没有接收到目标或者机器人的里程定位

    int tracker_state;

    double dist = calc_distance(target_odom, robot_odom);

    // 根据机器人与目标的距离决定跟踪状态
    if(dist > hold_dist)
    {
        tracker_state = FOLLOW;
    }
    else
    {
        tracker_state = STOP;
    }

    mpc::Polynome poly;

    switch(tracker_state) 
    {
        case STOP: 
        {
            // 发布机器人位置

            pub_traj_lmpc(robot_odom);          // 发布lmpc的参考轨迹

            pub_traj_nmpc(robot_odom);          // 发布nmpc的参考轨迹

            break;
        }
        case FOLLOW:
        {
            // 发布目标位置
            Eigen::Vector3d fix_target;
            Eigen::Vector3d target_pos;
            Eigen::Vector3d robot_pos;

            target_pos = odom2vector(target_odom);
            robot_pos = odom2vector(robot_odom);

            // 根据目标点位置画圆，半径是hold_dist，取目标点、机器人位置连线与圆的交点作为目标点
            fix_target = robot_pos + (target_pos - robot_pos) / dist * (dist - hold_dist);

            // std::cout << "target_pos:= " << target_pos.transpose() << std::endl;
            // std::cout << "robot_pos:= " << robot_pos.transpose() << std::endl;
            // std::cout << "fix_target:= " << fix_target.transpose() << std::endl;

            nav_msgs::Odometry fix_target_odom;
            fix_target_odom.pose.pose.position.x = fix_target[0];   // 目标位置
            fix_target_odom.pose.pose.position.y = fix_target[1];
            fix_target_odom.pose.pose.position.z = fix_target[2];
            fix_target_odom.pose.pose.orientation = target_odom.pose.pose.orientation;   // 目标姿态

            pub_traj_lmpc(fix_target_odom);         // 发布lmpc的参考轨迹

            pub_traj_nmpc(fix_target_odom);         // 发布nmpc的参考轨迹

            break;
        }
    }
}

int main( int argc, char * argv[] )
{ 
    ros::init(argc, argv, "tracker_state_machine");
    ros::NodeHandle node;
    ros::NodeHandle nh("~");
    ros::Duration(2.0).sleep();

    ROS_WARN("tracker_state_machine init done");

    traj_pub_lmpc = node.advertise<mpc::Polynome>("trajectory",3);
    traj_pub_nmpc = node.advertise<std_msgs::Float32MultiArray>("mpc/traj_point", 3);

    ros::Subscriber odom_sub1 = node.subscribe("/state_ukf/odom1", 50, odom1Callbck);   // robot1里程接收
    ros::Subscriber odom_sub2 = node.subscribe("/state_ukf/odom2", 50, odom2Callbck);   // robot2里程接收

    ros::Timer state_timer = node.createTimer(ros::Duration(0.05), stateCallback);

    ros::spin();

    return 0;
}