# [launch](http://wiki.ros.org/roslaunch/XML) 语法详解

#### arg
- 全局变量
- 变量定义:`<arg name="r", value="...">` or `<arg name="r", default="...">`
- value/default可以任意，都加双引号;区别是default可以被终端覆盖，value不可以
- 引用该变量:`$(arg r)`
#### param
- 避免全局使用，在namespace里使用
- attribute
  - name="namespace/name": Parameter name. Namespaces can be included in the parameter name, but globally specified names should be avoided.
  - value="value"(optional): Defines the value of the parameter. If this attribute is omitted, binfile, textfile or command must be specified.
  - type="str|int|double|bool|yaml"(optional): Specifies the type of the parameter. If you don't specify the type, roslaunch will attempt to automatically determine the type. These rules are very basic:
    - numbers with '.'s are floating point, integers otherwise;
    - "true" and "false" are boolean (not case-sensitive).
    - all other values are strings
  - textfile="$(find pkg-name)/path/file.txt"(optional): The contents of the file will be read and stored as a string. The file must be locally accessible, though it is strongly recommended that you use the package-relative $(find)/file.txt syntax to specify the location.
  - binfile="$(find pkg-name)/path/file"(optional): The contents of the file will be read and stored as a base64-encoded XML-RPC binary object. The file must be locally accessible, though it is strongly recommended that you use the package-relative $(find)/file.txt syntax to specify the location.
  - command="$(find pkg-name)/exe '$(find pkg-name)/arg.txt'"(optional): The output of the command will be read and stored as a string. It is strongly recommended that you use the package-relative $(find)/file.txt syntax to specify file arguments. You should also quote file arguments using single quotes due to XML escaping requirements.

#### node 
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
