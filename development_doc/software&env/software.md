# software


### wechat && wechat work
```
mkdir ./deepintemp
cd ./deepintemp

wget http://packages.deepin.com/deepin/pool/non-free/d/deepin-wine/deepin-wine_2.18-22~rc0_all.deb
wget http://packages.deepin.com/deepin/pool/non-free/d/deepin-wine/deepin-wine32_2.18-22~rc0_i386.deb
wget http://packages.deepin.com/deepin/pool/non-free/d/deepin-wine/deepin-wine32-preloader_2.18-22~rc0_i386.deb
wget http://packages.deepin.com/deepin/pool/non-free/d/deepin-wine-helper/deepin-wine-helper_1.2deepin8_i386.deb
wget http://packages.deepin.com/deepin/pool/non-free/d/deepin-wine-plugin/deepin-wine-plugin_1.0deepin2_amd64.deb
wget http://packages.deepin.com/deepin/pool/non-free/d/deepin-wine-plugin-virtual/deepin-wine-plugin-virtual_1.0deepin3_all.deb
wget http://packages.deepin.com/deepin/pool/non-free/d/deepin-wine-uninstaller/deepin-wine-uninstaller_0.1deepin2_i386.deb
wget http://packages.deepin.com/deepin/pool/non-free/u/udis86/udis86_1.72-2_i386.deb
wget http://packages.deepin.com/deepin/pool/non-free/d/deepin-wine/deepin-fonts-wine_2.18-22~rc0_all.deb
wget http://packages.deepin.com/deepin/pool/non-free/d/deepin-wine/deepin-libwine_2.18-22~rc0_i386.deb
wget https://packages.deepin.com/deepin/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_1.5.1-2_amd64.deb --no-check-certificate
wget https://packages.deepin.com/deepin/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_1.5.1-2_i386.deb --no-check-certificate

echo '准备添加32位支持'
sudo dpkg --add-architecture i386
echo '添加成功，准备刷新apt缓存信息...'
sudo apt update
echo '即将开始安装...'
sudo dpkg -i *.deb
echo '安装完成，正在自动安装依赖...'
sudo apt install -fy

rm -vfr ./deepintemp
```

- deb包下载(https://packages.deepin.com/deepin/pool/non-free/d/)
  - wechat:`https://packages.deepin.com/deepin/pool/non-free/d/deepin.com.wechat/deepin.com.wechat_2.6.8.65deepin0_i386.deb`
  - weixin_work:`https://packages.deepin.com/deepin/pool/non-free/d/deepin.com.weixin.work/deepin.com.weixin.work_2.8.10.2010deepin0_i386.deb`

## SJTU VPN on Ubuntu

## STM32 on Linux

### Env
- STM32CubeMX
- JAVA
- arm-linux-gcc交叉编译器
  - `sudo apt-get install gcc-arm-linux-gnueabi`
- CLion or VScode

## zsh
