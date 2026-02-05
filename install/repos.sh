#!/bin/sh

set +e

if [ $EUID -ne 0 ]; then
  echo "Please run as root!"
  exit
fi

apk add -lu --interactive=no \
    chimera-repo-user
    #chimera-repo-contrib

apk update
apk upgrade
