#!/bin/bash

set +e

if [ $EUID -ne 0 ]; then
  echo "Please run as root!"
  exit
fi

xbps-install -y \
  intel-video-accel \
  mesa-dri \
  mesa-vaapi \
  mesa-vdpau \
  mesa-vulkan-intel

echo "Intel items are now installed..."
