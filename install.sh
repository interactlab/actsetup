#!/bin/bash

set -e

echo "=== INSTALLING ROS ==="
bash <(curl -s https://raw.githubusercontent.com/interactlab/actsetup/master/install_ros.sh)
echo "=== ROS INSTALLED  ==="
echo "=== INSTALLING OPENRAVE ==="
bash <(curl -s https://raw.githubusercontent.com/interactlab/actsetup/master/install_openrave.sh)
echo "=== OPENRAVE INSTALLED ==="
echo "=== INSTALLING ACT ==="
bash <(curl -s https://raw.githubusercontent.com/interactlab/actsetup/master/install_act.sh)
echo "=== ACT INSTALLED ==="
