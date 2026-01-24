#!/bin/bash

set +e

if [ $EUID -ne 0 ]; then
  echo "Please run as root!"
  exit
fi

apk add -lu --interactive=no \
  imagemagick \
  satty \
  swappy

echo "GUIs are now installed ..."
