FROM nvidia/cudagl:11.2.1-devel-ubuntu18.04

# update source of ustc
RUN cp /etc/apt/sources.list /etc/apt/sources.list.ori && \
    sed -i s@/archive.ubuntu.com/@/mirrors.ustc.edu.cn/@g /etc/apt/sources.list && \
    sed -i s@/security.ubuntu.com/@/mirrors.ustc.edu.cn/@g /etc/apt/sources.list && \
    apt-get clean && \
    apt-get -y update  && apt -y install \
    freeglut3-dev clang-format build-essential cmake \
    xorg-dev libglu1-mesa-dev

# dependent lib
RUN apt update -y && apt upgrade -y && apt install libusb-dev -y
RUN apt-get install -y lsb-release gnupg

# ros source
RUN sh -c '. /etc/lsb-release && echo "deb http://mirrors.ustc.edu.cn/ros/ubuntu/ $DISTRIB_CODENAME main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
RUN apt-get update -y
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/Shanghai" > /etc/timezone
RUN apt-get -y install -y ros-melodic-desktop-full \
 && echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc

# ros lib for python
RUN apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential -y
RUN apt install python-rosdep 
RUN apt install -y python-pip

# ros init;rosdep update
RUN rosdep init
RUN /bin/sh -c "pip install rosdepc"
RUN rosdepc update

# software bag
# COPY ./exploration_environment  /home/exploration_environment

## 环境编译 catkin_make有误 【TODO】待解决
RUN cd  /home/exploration_environment 
# RUN /bin/bash -c "./exec.sh"
 #&& roslaunch vehicle_simulator system_garage.launch 
