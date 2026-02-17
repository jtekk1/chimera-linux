#!/bin/bash

set -e

if [ "$(id -u)" -eq 0 ]; then
	echo "Please do not run with doas, as root, or with sudo!"
	exit
fi

doas apk add -lu --interactive=no \
	chimera-artwork \
	chimera-artwork-kde

echo "Extras are now installed..."
