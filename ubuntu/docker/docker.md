# docker

## demo
- [gazebo](https://hub.docker.com/_/gazebo)
  
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