# Network config

## Ethernet 连接
>路由器已经拨号，通过LAN口网线接入，可以直接以太网连接，无需拨号
- 查看以太网卡名:
  > ifcongig

  ![以太网](./Ethernet.png)
  以太网显示在enp3s0,选择enp3s0
- 修改文件配置:
  ```
  sudo vim /etc/network/interfaces
  ＃添加
  auto enp3s0
  iface enp3s0 inet dhcp
  ```




