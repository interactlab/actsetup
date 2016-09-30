#!/bin/bash

set -e

#echo " * Adding apt repo for openrave"
#sudo add-apt-repository ppa:openrave/release
#echo " ==> Added"
#echo " * sudo apt-get install openrave"
#sudo apt-get install openrave
#echo " ==> Installed"

echo " * sudo apt-get update"
sudo apt-get update
echo " ==> Updated"

echo " * Installing lots of build dependencies"
sudo apt-get -y install libbz2-dev libpcre3-dev libcoin80-dev libsoqt4-dev libode-dev libann-dev libqhull-dev libassimp-dev liboctave-dev libavcodec-dev libavformat-dev libswscale-dev python-dev python-numpy python-sympy libboost1.54-dev libboost-date-time1.54-dev libboost-filesystem1.54-dev libboost-iostreams1.54-dev libboost-python1.54-dev libboost-regex1.54-dev libboost-system1.54-dev libboost-thread1.54-dev libxml2-dev libopenscenegraph-dev python-numpy python-scipy python-matplotlib
echo " ==> Installed"


echo " * Cloning openrave project"
if [ -e openrave ]; then
	sudo rm -rf openrave
fi
git clone https://github.com/personalrobotics/openrave
echo " ==> Cloned"

cd openrave
mkdir build
cd build
echo " * Building OpenRAVE"
cmake -DCMAKE_INSTALL_PREFIX=/usr .. > outputcmake.txt
sudo make install
echo " ==> Built"

if [ -e ~/catkin_ws/ ]; then
	read -p "We are going to globber your catkin_ws/ ... Are you sure? [Yy]" -n 1 -r
	echo    # (optional) move to a new line
	if [[ ! $REPLY =~ ^[Yy]$ ]]
	then
	    exit 1
	fi
	rm -rf ~/catkin_ws/
	mkdir -p ~/catkin_ws/src
else
	mkdir -p ~/catkin_ws/src
fi



