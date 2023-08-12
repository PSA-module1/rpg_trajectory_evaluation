#!/bin/zsh
. ~/.zshrc
cd /root/catkin_ws
catkin build catkin_simple
catkin build
echo "source /root/catkin_ws/devel/setup.zsh" >> ~/.zshrc
cd 
exec "$@"