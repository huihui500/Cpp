docker run -it --net=host \
    --env="DISPLAY" \
    -v /etc/localtime:/etc/localtime:ro\
    --env="QT_X11_NO_MITSHM=1" \
    -e DISPLAY=unix$DISPLAY\
    -e GDK_SCALE \
    -e GDK_DPI_SCALE \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --name ros_rviz_test ros:melodic

    docker run -d 
  -v /etc/localtime:/etc/localtime:ro \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -e DISPLAY=unix$DISPLAY \
  -e GDK_SCALE \
  -e GDK_DPI_SCALE \
  --name libreoffice \
  jess/libreoffice
