#!/bin/sh

set +e

if [ $EUID -ne 0 ]; then
  echo "Please run as root!"
  exit
fi

apk add -lu --interactive=no \
  chimera-artwork \
  chimera-artwork-kde

  # asciiquarium \
  # asciiquarium \
  # cmatrix \
  # pipes.c

echo "Extras are now installed..."
