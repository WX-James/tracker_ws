# tracker_ws
# 遥控-跟踪demo


（1）OSQP安装

```bash
git clone --recursive https://github.com/osqp/osqp
cd osqp
mkdir build
cd build
cmake .. -DBUILD_SHARED_LIBS=ON
make
sudo make install
```

（2）OSQP-Eigen安装

```bash
git clone https://github.com/robotology/osqp-eigen.git
cd osqp-eigen
mkdir build 
cd build
cmake ..
make
sudo make install
```

（3）casadi求解器安装

```bash
pip install casadi
```

（4）Scout仿真相关依赖

请参考松灵官方：https://github.com/agilexrobotics/ugv_gazebo_sim/tree/master/scout



# 启动

```bash
source devel/setup.bash
roslaunch tracker_demo spawn_scout_env.launch
```

