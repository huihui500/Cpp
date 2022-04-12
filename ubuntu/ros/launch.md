# [launch](http://wiki.ros.org/roslaunch/XML/node) 语法详解

- 变量定义:`<arg name="r", value="...">` or `<arg name="r", default="...">`
  - value/default可以任意，都加双引号;区别是default可以被终端覆盖，value不可以
  - 引用该变量:`$(arg r)`
- 节点启动:
    ``` xml
    <node pkg="…" type="…" name="…" respawn=true ns="…"/>
        <param name="...", value="$(arg r)"/>
        <remap from="A", to="B"/>
        <!-- TODO -->
        <param />
        <rosparam />
    ```
  - pkg: 功能包
  - type: 功能包内的节点名
  - name: 自定义节点名
  - respawn: respawn是当该节点停止执行的时候，会自动重新启动;
  - required: 当该节点停止执行的时候，会让整个launch 档都停止执行、关闭。
  - ns: 工作空间
  - if="true|false": true表示节点正常启动，false表示不启动该节点
  - remap可以把本节点的A映射成B发布或者把**收到的的B映射成A接收**

- 调用其他launch文件
``` xml
<include file="$(find openni2_launch)/launch/openni2.launch">
    <arg name="camera" value="rgbd_front_top"/>
    <arg name="d​​evice_id" value="#1"/>
    <arg name="d​​epth_registration" default="true"/>
</include>
```

- 逻辑判断 if/unless(功能相同)
``` xml
<arg name="load_driver" default="true"/>
<group if="$(arg load_driver)">
    <include file="$(find openni2_launch)/launch/openni2.launch"/>
</group>
```
> 终端运行时可以设定参数值
> roslaunch pkg node.launch load_driver:=false
