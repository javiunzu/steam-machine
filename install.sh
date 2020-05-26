#!/bin/bash
set -eu
dpkg --add-architecture i386
apt update
apt upgrade -y
echo steam steam/question select "I AGREE" | debconf-set-selections
DEBIAN_FRONTEND=noninteractive apt install -y task-kde-desktop steam htop tree tmux python3-pip p7zip-full clamtk apparmor apparmor-utils apparmor-profiles apparmor-profiles-extra firejail steam mesa-vulkan-drivers libglx-mesa0:i386 mesa-vulkan-drivers:i386 libgl1-mesa-dri:i386
