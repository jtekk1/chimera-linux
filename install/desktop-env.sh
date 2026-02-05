#!/bin/sh

set +e

if [ $EUID -ne 0 ]; then
  echo "Please run as root!"
  exit
fi

apk add -lu --interactive=no \
  blueman \
  bluez \
  chromium \
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
  swaylock \
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

# libspa-bluetooth \
# polkit-gnome \
# wl-clip-persist \
# sway-audio-idle-inhibit \
# SwayOSD \

echo "Window Manager and Desktop Environment is now set"
