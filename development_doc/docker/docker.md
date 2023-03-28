# docker

## demo
### ros:rviz可视化
- nvidia版本
```sh
<!-- 安装nvidia-docker后一定要重启docker -->
sudo systemctl restart docker
sudo nvidia-docker run --gpus all -it \
   -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
   -e DISPLAY=$DISPLAY \
   -v ${PWD}:${PWD} \
   -w ${PWD} \
   --name orbslam2 \
   orbslam2gl
```
- no nvidia version
  [rviz_dcoker 部署](https://answers.ros.org/question/393837/run-rviz-in-a-docker-with-hardware-acceleration-no-gui/)
## 换源
```bash
cp /etc/apt/sources.list /etc/apt/sources.list.ori && \
    sed -i s@/archive.ubuntu.com/@/mirrors.ustc.edu.cn/@g /etc/apt/sources.list && \
    sed -i s@/security.ubuntu.com/@/mirrors.ustc.edu.cn/@g /etc/apt/sources.list && \
    apt-get clean && \
    apt-get -y update
# ros ustc源
sh -c '. /etc/lsb-release && echo "deb http://mirrors.ustc.edu.cn/ros/ubuntu/ $DISTRIB_CODENAME main" > /etc/apt/sources.list.d/ros-latest.list'
apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
```
## run

> 容器运行命令

- `-d`:后台运行容器，并返回容器ID
- `-it`: 以交互模式运行容器，并分配一个容器终端
- `-p`:端口映射；eg: `-p 8888:8080`表示本地8888与容器8080端口映射
- `--name`：为容器指定一个名称
- `--cpuset`:指定CPU运行
- `-m`：设置容器使用内存最大值
- `--net`： 指定容器的网络连接类型，支持 bridge/host/none/container: 四种类型
- `--link`: 添加链接到另一个容器
- `--volume，-v`: 绑定一个卷

### examples

- ubuntu:`docker rundocker run -it -d --name ros_test -v /home/bag/mywork:~/catkin_ws/src -p 8022:22 -p 8889:8888 -p 5000:5001 ubuntu:20.04 /bin/bash `
- 
### docker 问题
- `nvidia-docker`安装后,docker 404; 重启docker即可
