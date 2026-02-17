#!/bin/bash

set -e

if [ "$(id -u)" -eq 0 ]; then
	echo "Please do not run with doas/sudo, or run as root!"
	exit
fi

doas apk add -lu --interactive=no \
	blueman \
	bluez \
	cliphist \
	flatpak \
	foot \
	gnome-keyring \
	greetd \
	grim \
	imv \
	kanshi \
	libnotify \
	mako \
	mpv \
	nautilus \
	pipewire \
	shotman \
	slurp \
	starship \
	swaybg \
	swayidle \
	swww \
	tuigreet \
	wayland-utils \
	wl-clipboard \
	wlogout \
	wlopm \
	wlr-randr \
	wlsunset \
	waybar \
	wofi \
	xdg-desktop-portal-gtk \
	xdg-desktop-portal-wlr \
	xdg-desktop-portal \
	xinput \
	xrdb \
	xstow \
	xwayland

echo "Window Manager and Desktop Environment is now set"
