#!/bin/bash

set -e

sudo apt-get -y install libtinyxml2-dev # ensure tinyxml is installed
sudo apt-get -y install ros-indigo-srdfdom
cd ~/catkin_ws/src
git clone https://github.com/nlandolfi/actsrc.git ./
git submodule update --init --recursive

source ~/.bashrc # just in case for catkin_init_workspace
catkin_init_workspace
cd ..
catkin_make

git config --global core.editor vim # :p
sudo apt-get -y install python-pip
sudo pip uninstall sympy
sudo pip install sympy==0.7.1
source ./devel/setup.sh
echo " * Adding catkin devel/setup.sh call to bashrc"
echo "source ~/catkin_ws/devel/setup.sh" >> ~/.bashrc
source ~/.bashrc

