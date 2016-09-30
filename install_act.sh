#!/bin/bash

set -e

sudo apt-get -y install libtinyxml2-dev # ensure tinyxml is installed
sudo apt-get -y install ros-indigo-srdfdom
cd ~/catkin_ws/src
git clone https://github.com/nlandolfi/actsrc.git ./
git submodule update --init --recursive

source ~/.bashrc # just in case for catkin_init_workspace
catkin_init_workspace
echo " * Adding catkin devel/setup.sh call to bashrc"
echo "source ~/catkin_ws/devel/setup.sh" >> ~/.bashrc
source ~/.bashrc

cd ..
source ./devel/setup.sh
catkin_make

