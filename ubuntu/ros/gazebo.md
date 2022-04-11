# gazebo 

## launch 文件
### demo
``` xml
<launch>

  <!-- <arg name="use_sim_time" default="true"/> -->
  <arg name="gui" default="true"/>
  <arg name="headless" default="false"/>
  <arg name="debug" default="false"/>
  <!-- <remap from="robot/laser/scan" to="/scan"/> -->

  <include file="$(find gazebo_ros)/launch/empty_world.launch">
    <arg name="world_name" value="$(find gazebo_pkg)/world/race_with_cone.world"/> 
    <arg name="debug" value="$(arg debug)" />
    <arg name="gui" value="$(arg gui)" />
  </include>
  
  <!-- Load the URDF into the ROS Parameter Server -->
  <arg name="model" default="$(find gazebo_pkg)/urdf/waking_robot.xacro" />
 
  <param name="robot_description" command="$(find xacro)/xacro  --inorder $(arg model)" />
 
  <!-- Run a python script to send a service call the gazebo_ros to spawn a URDF robot -->
  <node name="urdf_spawner" pkg="gazebo_ros" type="spawn_model" respawn="false" output="screen"
	args="-urdf -model robot -param robot_description -z 0.05"/> 

  <node name="joint_state_publisher" pkg="joint_state_publisher" type="joint_state_publisher" />
  <node name="robot_state_publisher" pkg="robot_state_publisher" type="robot_state_publisher"/>

</launch>
```

### 详解

#### [empty_world.launch](http://gazebosim.org/tutorials/?tut=ros_roslaunch)

- `"paused" default="false"`:以暂停状态启动gazebo
- `"use_sim_time" default="true"`:使需要时间的节点得到gazebo发布的仿真时间(由topic`/clock`发布)
- `"gui" default="true"`: 启动gazebo界面
- `"headless" default="false"`:启动日志记录，实际上啥也不做‘
- `name="debug" default="false"`：运行gazebo-server,使用gdb去debug
<!-- TODO -->
- `name="physics" default="ode"`: 
- `name="verbose" default="false"`：运行gazebo-server和client，打印errors和warnings到终端
<!-- Note: the world_name is with respect to GAZEBO_RESOURCE_PATH environmental variable -->
- `"world_name" default="worlds/empty.world"`:用于启动其他环境，写入环境所在路径；
  - eg：`<arg name="world_name" value="$(find gazebo_pkg)/world/race_with_cone.world"/> `
- `"respawn_gazebo" default="false"`:
- `"use_clock_frequency" default="false"`:
- `"pub_clock_frequency" default="100"`:
- `name="server_required" default="false"`：gzserver（gazebo Server）退出时终止launch脚本
- `name="gui_required" default="false`：gzclient（用户界面窗口）退出时终止launch脚本

#### [URDF]()
-  