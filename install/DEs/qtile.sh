#!/bin/bash

set +e

if [ $EUID -ne 0 ]; then
  echo "Please run as root!"
  exit
fi

xbps-install -y \
  qtile \
  qtile-wayland \
  python3-qtile-extras \
  python3-dbus-fast \
  qt5-wayland \
  qt6-wayland \
  wayland-scanner++ \
  wayland-protocols \
  wlroots

echo "GUIs are now installed ..."
