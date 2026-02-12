#!/bin/bash

set -e

if [ "$(id -u)" -eq 0 ]; then
	echo "Please do run as with doas/sudo, nor run as root!"
	exit
fi

doas apk add -lu --interactive=no \
	argon2-devel \
	asciidoctor \
	bash-completion \
	botan \
	botan-devel \
	cava \
	cmake \
	extra-cmake-modules \
	glslang \
	glslang-devel \
	glslang-progs \
	gtkmm3.0 \
	gtk4-layer-shell-devel \
	keyutils-devel \
	libdbusmenu-gtk3 \
	libdbusmenu-devel \
	libliftoff \
	libseat \
	libseat-devel \
	minizip-devel \
	pkgconf \
	qrencode-devel \
	qt6-qt5compat-devel \
	qt6-qtbase-concurrent \
	qt6-qtbase-devel \
	qt6-qtbase-printsupport \
	qt6-qtbase-test \
	qt6-qtimageformats-devel \
	qt6-qtnetworkauth-devel \
	qt6-qtsvg-devel \
	qt6-qttools-devel \
	qt6-qtwayland-devel \
	qt6-qtwebsockets-devel \
	readline-devel \
	sassc \
	scdoc \
	wayland-protocols \
	xcb-util-errors
