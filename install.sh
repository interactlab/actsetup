#!/bin/bash

set -e

echo "=== INSTALLING ROS ==="
bash <(curl -s http://mywebsite.com/myscript.tx://raw.githubusercontent.com/nlandolfi/actsetup/master/install_ros.sh)
echo "=== ROS INSTALLED  ==="
echo "=== INSTALLING OPENRAVE ==="
bash <(curl -s http://mywebsite.com/myscript.tx://raw.githubusercontent.com/nlandolfi/actsetup/master/install_openrave.sh)
echo "=== OPENRAVE INSTALLED ==="
echo "=== INSTALLING ACT ==="
bash <(curl -s http://mywebsite.com/myscript.tx://raw.githubusercontent.com/nlandolfi/actsetup/master/install_act.sh)
echo "=== ACT INSTALLED ==="
