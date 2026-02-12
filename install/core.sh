#!/bin/bash

set -e

if [ "$(id -u)" -eq 0 ]; then
	echo "Please do not run with doas, as root, or with sudo!"
	exit
fi

doas apk add -lu --interactive=no \
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
	tailscale \
	tea \
	tmux \
	upower \
	xdg-user-dirs

echo "Core System items are now installed..."
