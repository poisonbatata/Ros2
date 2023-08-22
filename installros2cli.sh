#!/bin/bash

######################################
# CLI Ros2 Install for Ubuntu Server #
######################################

if [ "$EUID" -ne 0 ]
  then echo "Execute com o usuário root ou utilize o sudo."
  exit
fi

apt update
apt full-upgrade -y
apt autoremove -y


### Set locale
sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8


### Setup Sources
apt install software-properties-common
add-apt-repository universe

apt update && sudo apt install curl -y
curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null


### Install ROS 2 packages
apt update
apt full-upgrade -y
apt autoremove -y

apt install ros-foxy-ros-base python3-argcomplete

apt install ros-dev-tools


### Environment setup
source /opt/ros/foxy/setup.bash
echo "source /opt/ros/foxy/setup.bash" >> ~/.bashrc
echo "source /opt/ros/foxy/setup.bash" >> /home/ubuntu/.bashrc



