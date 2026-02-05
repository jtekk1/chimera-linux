#!/bin/sh

set +e

if [ $EUID -ne 0 ]; then
	echo "Please run as root!"
	exit
fi

apk add -lu --interactive=no \
    btop \
    dialog \
    dust \
    fastfetch \
    gdu \
    glow \
    impala \
    lazygit \
    lynx \
    ncdu \
    neovim 

# bluetui \
# luarocks \
# spotify-tui \
# tldr \
# wiremix

echo "TUIs are now installed..."
