#!/bin/bash

set +e

if [ $EUID -ne 0 ]; then
  echo "Please run as root!"
  exit
fi

apk add \
  atuin \
  bat \
  eza \
  fd \
  fzf \
  jq \
  lsof \
  ripgrep \
  rsync \
  wget \
  zip \
  zoxide

# plocate \

echo "Cli Tools are now installed... "
