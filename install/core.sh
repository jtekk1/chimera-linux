#!/bin/sh

set +e

if [ $EUID -ne 0 ]; then
  echo "Please run as root!"
  exit
fi

apk add --interactive=no \
  base-devel \
  base-full \
  bash \
  brightnessctl \
  chrony \
  curl \
  git \
  github-cli \
  linux-stable \
  linux-stable-devel \
  networkmanager \
  tailscale \
  tea \
  tmux \
  upower \
  xdg-user-dirs 

echo "Core System items are now installed..."
