#!/bin/bash

set -e

echo " * Adding ROS package server to apt sources"
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
echo " * Grabbing ROS key to ensure not malicious packages"
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net --recv-key 0xB01FA116
echo " * Ensuring up-to-date package index"
sudo apt-get -y update
echo " * Installing ros indigo desktop full"
# Don't lock down this dep because seems to depend on timestamp, not sure why
# but I've also only ever seen 1 version on it and we specifically grap there package server
# so I'm willing to trust it
#sudo apt-get -y install ros-indigo-desktop-full="1.1.4-0trusty-20161018-203600-0700"
sudo apt-get -y install ros-indigo-desktop-full
echo " ==> Installed, to find packages: `apt-cache search ros-indigo`"
echo " * Intializing `rosdep` (`sudo rosdep init`)"
# Not sure what this is, but I needed to remove it to get it to work
if [ -e /etc/ros/rosdep/sources.list.d/20-default.list ]; then
    echo " ** Found sources list already present, removing"
    sudo rm /etc/ros/rosdep/sources.list.d/20-default.list
fi
sudo rosdep init
echo " ==> Initialized"
echo " * Updating rosdep (`rosdep update`)"
rosdep update
echo " ==> Updated"
echo " * Adding ROS setup.sh call to bashrc"
echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
source ~/.bashrc
echo " ==> Added"
echo " * Installing rosinstall"
sudo apt-get -y install python-rosinstall="0.7.8-1"
echo " ==> Installed"
