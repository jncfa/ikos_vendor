#!/bin/bash
set -e

sudo apt-get update
rosdep update --rosdistro=$ROS_DISTRO
rosdep install --from-paths . --ignore-src -y --rosdistro=$ROS_DISTRO