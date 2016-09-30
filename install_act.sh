sudo apt-get -y install libtinyxml2-dev # ensure tinyxml is installed
sudo apt-get -y install ros-indigo-srdfdom
cd src
git clone https://github.com/nlandolfi/actsrc.git ./
git submodule update --init --recursive
cd ..
source ./devel/setup.sh
catkin_make

