#!/bin/bash

set -e

if [ "$(id -u)" -eq 0 ]; then
	echo "Please do not run with doas, as root, or with sudo!"
	exit
fi

doas apk add -lu --interactive=no \
	satty \
	swappy

# imagemagick \
echo "GUIs are now installed ..."
