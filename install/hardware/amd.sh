#!/bin/bash

set +e

if [ ! $EUID -ne 0 ]; then
  echo "Please run as root!"
  exit
fi

doas apk add -lu --interactive=no \
  vulkan-loader \
  vulkan-loader-devel \
  vulkan-headers \
  vulkan-tools \
  vulkan-utility-libraries \
  mesa \
  mesa-dri \
  mesa-egl-libs \
  mesa-gl-libs \
  mesa-gles1-libs \
  mesa-gles2-libs \
  mesa-opencl \
  mesa-vulkan \
  mesa-vaapi \
  amdgpu_top \
  firmware-linux-amdgpu \
  firmware-linux-amd-ucode \
  llvm \
  ucode-amd

echo "AMD Drivers Installed!!!"
# firmware-linux-amdnpu-20251125-r0
# libdrm-2.4.125-r0
