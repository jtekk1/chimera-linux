#!/bin/bash

set -e

if [ "$(id -u)" -eq 0 ]; then
	echo "Please do not run with doas/sudo, or run as root!"
	exit
fi

doas apk add -lu --interactive=no \
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
