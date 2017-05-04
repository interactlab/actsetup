#!/bin/bash

set -e

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

# ensure tinyxml is installed
sudo apt-get -y install \
    libtinyxml2-dev="0~git20120518.1.a2ae54e-1" \
    ros-indigo-srdfdom="0.3.5-0trusty-20170327-220559-0700" \
    python-pip="1.5.4-1ubuntu4"
cd ~/catkin_ws/src
git clone https://github.com/interactlab/actsrc.git ./
# We have our ros dependencies as git modules, therefore
# we need to grab download all of these
git submodule update --init --recursive

source ~/.bashrc # just in case for catkin_init_workspace
source /opt/ros/indigo/setup.bash # sourcing bash file wasn't doing the trick?
catkin_init_workspace
cd ..
catkin_make

git config --global core.editor vim # :p

# new sympy version causes a bug (?) in ikfast, so revert to known
# working old version
sudo pip uninstall sympy
sudo pip install sympy==0.7.1
sudo pip install enum34

source ./devel/setup.sh
echo " * Adding catkin devel/setup.sh call to bashrc"
echo "source ~/catkin_ws/devel/setup.sh" >> ~/.bashrc
source ~/.bashrc
echo "=> Added"
