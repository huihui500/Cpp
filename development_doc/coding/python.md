# python

## use
- 使用别人的git仓库python包，找不到包：添加环境变量 `export PYTHONPATH=<path1>:<path1>:$PYTHONPATH`
- pip换源：
    ```
    [global]
    timeout = 6000
    index-url = http://pypi.opencloud.sensetime.comrepository/pypi-proxy/simple/
    extra-index-url = http://10.10.40.93:80/simple
                      <other source>
    trusted-host = 
                pypi.opencloud.sensetime.com
                10.10.40.93
                <other source>
    ```
- 输出保存到日志中：`python train.py 2>&1 | tee <path>.log &`
  - 2 >& 1   stderr(标准错误输出)重定向到标准输出(屏幕)
  - 最后的&是后台运行 


  