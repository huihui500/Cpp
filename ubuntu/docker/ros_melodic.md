# ros
> 基于melodic镜像搭建整套的ros环境(gazebo rviz等)


## 
``` bash
# source
deb http://mirrors.ustc.edu.cn/ubuntu/ bionic main restricted
deb http://mirrors.ustc.edu.cn/ubuntu/ bionic-updates main restricted
deb http://mirrors.ustc.edu.cn/ubuntu/ bionic universe
deb http://mirrors.ustc.edu.cn/ubuntu/ bionic-updates universe
deb http://mirrors.ustc.edu.cn/ubuntu/ bionic multiverse
deb http://mirrors.ustc.edu.cn/ubuntu/ bionic-updates multiverse
deb http://mirrors.ustc.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
deb http://mirrors.ustc.edu.cn/ubuntu/ bionic-security main restricted
deb http://mirrors.ustc.edu.cn/ubuntu/ bionic-security universe
deb http://mirrors.ustc.edu.cn/ubuntu/ bionic-security multiverse

```

``` bash
echo "deb ..(中科大源)" > /etc/apt/sources.list
apt update
apt upgrade -y
# ros ustc源
sh -c '. /etc/lsb-release && echo "deb http://mirrors.ustc.edu.cn/ros/ubuntu/ $DISTRIB_CODENAME main" > /etc/apt/sources.list.d/ros-latest.list'
apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

apt install ros-melodic-gazebo* ros-melodic-rviz*
```