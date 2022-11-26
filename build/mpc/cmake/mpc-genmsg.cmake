# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "mpc: 1 messages, 0 services")

set(MSG_I_FLAGS "-Impc:/home/pi/Desktop/tracker_ws/src/mpc/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(mpc_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/pi/Desktop/tracker_ws/src/mpc/msg/Polynome.msg" NAME_WE)
add_custom_target(_mpc_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mpc" "/home/pi/Desktop/tracker_ws/src/mpc/msg/Polynome.msg" "geometry_msgs/Point:geometry_msgs/Vector3"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(mpc
  "/home/pi/Desktop/tracker_ws/src/mpc/msg/Polynome.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mpc
)

### Generating Services

### Generating Module File
_generate_module_cpp(mpc
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mpc
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(mpc_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(mpc_generate_messages mpc_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/Desktop/tracker_ws/src/mpc/msg/Polynome.msg" NAME_WE)
add_dependencies(mpc_generate_messages_cpp _mpc_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mpc_gencpp)
add_dependencies(mpc_gencpp mpc_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mpc_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(mpc
  "/home/pi/Desktop/tracker_ws/src/mpc/msg/Polynome.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mpc
)

### Generating Services

### Generating Module File
_generate_module_eus(mpc
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mpc
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(mpc_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(mpc_generate_messages mpc_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/Desktop/tracker_ws/src/mpc/msg/Polynome.msg" NAME_WE)
add_dependencies(mpc_generate_messages_eus _mpc_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mpc_geneus)
add_dependencies(mpc_geneus mpc_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mpc_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(mpc
  "/home/pi/Desktop/tracker_ws/src/mpc/msg/Polynome.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mpc
)

### Generating Services

### Generating Module File
_generate_module_lisp(mpc
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mpc
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(mpc_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(mpc_generate_messages mpc_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/Desktop/tracker_ws/src/mpc/msg/Polynome.msg" NAME_WE)
add_dependencies(mpc_generate_messages_lisp _mpc_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mpc_genlisp)
add_dependencies(mpc_genlisp mpc_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mpc_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(mpc
  "/home/pi/Desktop/tracker_ws/src/mpc/msg/Polynome.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mpc
)

### Generating Services

### Generating Module File
_generate_module_nodejs(mpc
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mpc
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(mpc_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(mpc_generate_messages mpc_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/Desktop/tracker_ws/src/mpc/msg/Polynome.msg" NAME_WE)
add_dependencies(mpc_generate_messages_nodejs _mpc_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mpc_gennodejs)
add_dependencies(mpc_gennodejs mpc_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mpc_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(mpc
  "/home/pi/Desktop/tracker_ws/src/mpc/msg/Polynome.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mpc
)

### Generating Services

### Generating Module File
_generate_module_py(mpc
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mpc
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(mpc_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(mpc_generate_messages mpc_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/Desktop/tracker_ws/src/mpc/msg/Polynome.msg" NAME_WE)
add_dependencies(mpc_generate_messages_py _mpc_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mpc_genpy)
add_dependencies(mpc_genpy mpc_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mpc_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mpc)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mpc
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(mpc_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(mpc_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mpc)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mpc
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(mpc_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(mpc_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mpc)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mpc
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(mpc_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(mpc_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mpc)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mpc
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(mpc_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(mpc_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mpc)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mpc\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mpc
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(mpc_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(mpc_generate_messages_py geometry_msgs_generate_messages_py)
endif()
