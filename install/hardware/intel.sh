#!/bin/sh

set +e

if [ $EUID -ne 0 ]; then
  echo "Please run as root!"
  exit
fi

apk add -lu --interactive=no \
  intel-vaapi-driver \
  ucode-intel-full \
  mesa \
  mesa-devel \
  mesa-dri \
  mesa-egl-libs \
  mesa-gbm-libs \
  mesa-gl-libs \
  mesa-gles1-libs \
  mesa-gles2-libs \
  mesa-opencl \
  mesa-vulkan

echo "Intel items are now installed..."
