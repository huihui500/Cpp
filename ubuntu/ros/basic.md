# 基础命令

## 安装ros

### 问题解决
- `rosdep init && rosdep update`失败
  - 解决1(国内源):`pip install rosdepc && rosdepc update`
  - 解决2(本地手动改):如rosdistro.zip
## rospack
- find:定位功能包路径
  - eg:`rospack find pkg_name`



## gazebo
- 查看版本:`dpkg -l | grep gazebo`