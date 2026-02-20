#!/bin/bash

set -e

SWAYOSD_VER='0.3.0'
WLROOTS_VER='0.19.2'
SCENEFX_VER='0.4.1'
MANGO_VER='0.12.3'

cleanup_src() {
  echo "cleaning up..."
  PKGS="wlroots scenefx mangowc swaylock-effects SwayOSD wl-clip-persist"
  for PKG in $PKGS; do
    if [ -d "$PKG" ]; then
      rm -rf $PKG
      echo "Removing $PKG directory..."
    fi
  done
}

if [ "$(id -u)" -eq 0 ]; then
  echo "Please do not run with doas/sudo, nor as root!"
  exit
fi

trap cleanup_src EXIT INT TERM

echo "Setting up WLROOTS"
if [ -f "/usr/lib/libwlroots-0.19.so" ]; then
  echo "WLROOTS found.  Skipping..."
else
  git clone -b $WLROOTS_VER https://gitlab.freedesktop.org/wlroots/wlroots.git
  cd wlroots
  meson build -Dprefix=/usr
  doas ninja -C build install
  cd ..
fi

echo "Setting up SCENEFX"
if [ -f "/usr/lib/libscenefx-0.4.so" ]; then
  echo "SCENEFX found.  Skipping..."
else
  git clone -b $SCENEFX_VER https://github.com/wlrfx/scenefx.git
  cd scenefx
  meson build -Dprefix=/usr
  doas ninja -C build install
  cd ..
fi

echo "Setting up Mango"
if [ "$(mango -v | head -n 1 | awk '{print $2}')" == "$MANGO_VER" ]; then
  echo "Mango is found on the correct version"
else
  git clone -b $MANGO_VER https://github.com/DreamMaoMao/mangowc.git
  cd mangowc
  meson build -Dprefix=/usr
  doas ninja -C build install
  cd ..
fi

echo "Setting up Swaylock-Effects"
if command -v swaylock >/dev/null 2>&1; then
  echo "Swaylock-Effects is already in the system.  Skipping..."
else
  git clone https://github.com/jirutka/swaylock-effects.git
  cd swaylock-effects
  meson build
  ninja -C build
  doas ninja -C build install
  cd ..
fi

echo "Setting up SwayOSD"
if [ "$(swayosd-client -V | head -n 1 | awk '{print $2}')" == "$SWAYOSD_VER" ]; then
  echo "SwaysOSD is already in the system.  Skipping..."
else
  git clone https://github.com/ErikReider/SwayOSD.git
  cd SwayOSD
  meson setup build --buildtype release
  meson compile -C build
  doas meson install -C build
  cd ..
fi

echo "Installing Items via Cargo!"

if [ -f "$HOME/.cargo/bin/wiremix" ]; then
  echo "Wiremix is found, skipping..."
else
  echo "Installihng Wiremix"
  cargo install wiremix
fi

if [ -f "$HOME/.cargo/bin/bluetui" ]; then
  echo "Bluetui is found, skipping..."
else
  echo "Installing BlueTUI"
  cargo install bluetui
fi

if [ -f "$HOME/.cargo/bin/wl-clip-persist" ]; then
  echo "wl-clip-persist is found, skipping..."
else
  echo "Installing wl-clip-persist"
  git clone https://github.com/Linus789/wl-clip-persist.git
  cd wl-clip-persist
  cargo build --release
  mv ./target/release/wl-clip-persist ~/.cargo/bin
  cd ..
fi
