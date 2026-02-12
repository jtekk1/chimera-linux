#!/bin/bash

set -e

if [ "$(id -u)" -eq 0 ]; then
	echo "Please do not run with doas, as root, or with sudo!"
	exit
fi

doas apk add --interactive=no \
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
