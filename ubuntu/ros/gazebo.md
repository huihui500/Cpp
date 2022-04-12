# gazebo 

## [download](http://gazebosim.org/download)
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
- [tutorial1](http://gazebosim.org/tutorials/?tut=ros_roslaunch)
- [tutorial2](https://www.guyuehome.com/34776)
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

#### [URDF](http://wiki.ros.org/urdf) and [XACRO](https://blog.csdn.net/lxlong89940101/article/details/88679695)
- `xacro`转`urdf`：``rosrun xacro xacro `rospack find robot_pkg`/robots/robot.xacro -o /tmp/robot.urdf``
  - 结构查看:`check_urdf pr2.urdf`
  - 可视化结构tree:`urdf_to_graphiz robot.urdf`
- 向gazebo添加模型：
  - 命令形式:```rosrun gazebo_ros spawn_model -file `rospack find robot_pkg`/urdf/ROBOT.urdf -urdf -x 0 -y 0 -z 1 -model ROBOT```
    - [Q](https://answers.ros.org/question/276753/urdf-spawn-into-gazebo-world-error/): 运行时卡住，显示:`Waiting for service /gazebo/spawn_urdf_model`
    - A: 先启动`roscore`, 再用`rosrun gazebo_ros gazebo`启动gazebo即可
  - launch文件形式 
    ``` xml
    <node name="urdf_spawner" pkg="gazebo_ros" type="spawn_model" respawn="false" output="screen"
    	args="-urdf -model ROBOT -file `rospack find robot_pkg`/urdf/ROBOT.urdf -x 0 -y 0 -z 1"/> 
    <!-- 或者是以param形式添加模型 -->
    <!-- <arg name="model" default="$(find gazebo_pkg)/urdf/waking_robot.xacro" /> -->
    <param name="robot_description" command="$(find xacro)/xacro  --inorder $(arg model)" />
    
    <param name="robot_description" command="`rospack find robot_pkg`/urdf/ROBOT.urdf" />
    <node name="urdf_spawner" pkg="gazebo_ros" type="spawn_model" respawn="false" output="screen"
	    args="-urdf -model robot -param robot_description -z 0.05"/> 
    ```