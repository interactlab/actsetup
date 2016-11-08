#!/bin/bash

set -e

echo " * \`$ sudo apt-get update\`"
sudo apt-get update
echo " ==> Updated"

echo " * Installing lots of build dependencies"
sudo apt-get -y install \
    libann-dev="1.1.2+doc-4.1" \
    libassimp-dev="3.0~dfsg-2" \
    libavcodec-dev="6:9.18-0ubuntu0.14.04.1" \
    libavformat-dev="6:9.18-0ubuntu0.14.04.1" \
    libboost-date-time1.54-dev="1.54.0-4ubuntu3.1" \
    libboost-filesystem1.54-dev="1.54.0-4ubuntu3.1" \
    libboost-iostreams1.54-dev="1.54.0-4ubuntu3.1" \
    libboost-python1.54-dev="1.54.0-4ubuntu3.1" \
    libboost-regex1.54-dev="1.54.0-4ubuntu3.1" \
    libboost-system1.54-dev="1.54.0-4ubuntu3.1" \
    libboost-thread1.54-dev="1.54.0-4ubuntu3.1" \
    libboost1.54-dev="1.54.0-4ubuntu3.1" \
    libbz2-dev="1.0.6-5" \
    libcoin80-dev="3.1.4~abc9f50-4ubuntu2" \
    liboctave-dev="3.8.1-1ubuntu1" \
    libode-dev="2:0.11.1-4ubuntu1" \
    libopenscenegraph-dev="3.2.0~rc1-4ubuntu0.1" \
    libpcre3-dev="1:8.31-2ubuntu2.3" \
    libqhull-dev="2012.1-4" \
    libsoqt4-dev="1.6.0~e8310f-1" \
    libswscale-dev="6:9.18-0ubuntu0.14.04.1" \
    libxml2-dev="2.9.1+dfsg1-3ubuntu4.8" \
    python-dev="2.7.5-5ubuntu3" \
    python-matplotlib="1.3.1-1ubuntu5" \
    python-numpy="1:1.8.2-0ubuntu0.1" \
    python-sympy="0.7.4.1-1" \
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
