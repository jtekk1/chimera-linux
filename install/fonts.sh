#!/bin/bash

set +e

if [ $EUID -ne 0 ]; then
  echo "Please run as root!"
  exit
fi

apk add -lu --interactive=no \
  fonts-font-awesome-otf \
  fonts-nerd-caskaydia-cove \
  fonts-nerd-caskaydia-mono \
  fonts-nerd-daddy-time-mono \
  fonts-nerd-dejavu-sans-mono \
  fonts-nerd-jetbrains-mono \
  fonts-nerd-noto \
  font-terminus

echo "Fonts installed ... "
