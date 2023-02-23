# CMakeLists.txt

``` cmake
<!-- cmake最低版本要求 -->
cmake_minimum_required(VERSION 2.8.3)
<!-- 工程名 -->
project(racecar_gazebo)

find_package(catkin REQUIRED COMPONENTS
  gazebo_ros
)
```
- cmake 软链接:`ln -s /usr/local/bin/cmake /usr/bin/cmake`
- 多版本opencv:指定版本文件路径
    ``` cmake
    set(OpenCV_DIR /usr/local/share/OpenCV)
    find_package(OpenCV REQUIRED)
    ```
- 指定优先寻库路径
    ``` cmake
    set(CMAKE_PREFIX_PATH /home/khm/bag/libtorch)
    find_package(Torch REQUIRED)
    ```
- 指定库(cmake找不到的)
    ``` cmake
    set(ONNXRUNTIME_ROOT_PATH /home/khm/bag/onnxruntime-linux-x64-1.9.0)
    set(ONNXRUNTIME_INCLUDE_DIRS ${ONNXRUNTIME_ROOT_PATH}/include/)
    set(ONNXRUNTIME_LIB ${ONNXRUNTIME_ROOT_PATH}/lib/libonnxruntime.so.1.9.0)
    ```
## opencv
- ros下opencv3.2:`set(OpenCV_DIR /usr/share/OpenCV/)` 
- opencv4:`set(OpenCV_DIR /usr/local/share/OpenCV)`
### 版本查看
- OpenCV3: `pkg-config --modversion opencv`
- OpenCV4: `pkg-config --modversion opencv`



