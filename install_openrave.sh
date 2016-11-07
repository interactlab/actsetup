#!/bin/bash

set -e

echo " * \`$ sudo apt-get update\`"
sudo apt-get update
echo " ==> Updated"

echo " * Installing lots of build dependencies"
sudo apt-get -y install \
    libbz2-dev="1.0.6-5" \
    libpcre3-dev="1:8.31-2ubuntu2.3" \
    libcoin80-dev="3.1.4~abc9f50-4ubuntu2" \
    libsoqt4-dev="1.6.0~e8310f-1" \
    libode-dev="2:0.11.1-4ubuntu1" \
    libann-dev="1.1.2+doc-4.1" \
    libqhull-dev="2012.1-4" \
    libassimp-dev="3.0~dfsg-2" \
    liboctave-dev="3.8.1-1ubuntu1" \
    libavcodec-dev \
    libavformat-dev \
    libswscale-dev \
    python-dev \
    python-numpy \
    python-sympy \
    libboost1.54-dev \
    libboost-date-time1.54-dev \
    libboost-filesystem1.54-dev \
    libboost-iostreams1.54-dev \
    libboost-python1.54-dev \
    libboost-regex1.54-dev \
    libboost-system1.54-dev \
    libboost-thread1.54-dev \
    libxml2-dev \
    libopenscenegraph-dev python-numpy python-scipy python-matplotlib
echo " ==> Installed"

echo " * Cloning openrave project"
if [ -e openrave ]; then
    sudo rm -rf openrave
fi
git clone https://github.com/interactlab/openrave
echo " ==> Cloned"

cd openrave
mkdir build
cd build
echo " * Building OpenRAVE"
cmake -DCMAKE_INSTALL_PREFIX=/usr .. > outputcmake.txt
sudo make install
echo " ==> Built"

# Set up basic catkin_ws dir and src dir, to be filled by install_act.sh
if [ -e ~/catkin_ws/ ]; then
    read -p "We are going to clobber your catkin_ws/ ... Are you sure? [Yy]" -n 1 -r
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
