cmake_minimum_required(VERSION 3.0.2)
project(tracker_demo)

find_package(Eigen3 REQUIRED)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  std_msgs
  geometry_msgs
  message_generation
  cv_bridge

  mpc
)

# Generate messages in the 'msg' folder
# add_message_files(
#   FILES
#   )
  
# Generate added messages and services with any dependencies listed here
generate_messages(
  DEPENDENCIES
  std_msgs
  geometry_msgs
)


catkin_package(
  INCLUDE_DIRS include
  LIBRARIES tracker_demo
  CATKIN_DEPENDS mpc  roscpp rospy std_msgs sensor_msgs geometry_msgs
#  DEPENDS system_lib
  message_runtime
)

include_directories(
  include
  SYSTEM
  ${catkin_INCLUDE_DIRS} ${PROJECT_SOURCE_DIR}/include
  ${EIGEN3_INCLUDE_DIR}
  ${PCL_INCLUDE_DIRS}
)

add_executable(tracker_state_machine src/tracker_state_machine.cpp)
target_link_libraries(tracker_state_machine ${catkin_LIBRARIES})
add_dependencies(tracker_state_machine ${${PROJECT_NAME}_EXPORTED_TARGETS})


