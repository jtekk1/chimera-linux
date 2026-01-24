#!/bin/bash

set +e

if [ $EUID -ne 0 ]; then
	echo "Please run as root!"
	exit
fi

apk add -lu --interactive=no \
	wayland-protocols \
	xcb-util-errors \
	libliftoff \
	glslang \
	glslang-devel \
	glslang-progs \
	gtkmm3.0 \
	cava \
	sassc \
	gtk4-layer-shell-devel \
	libdbusmenu-gtk3 \
	libdbusmenu-devel \
	botan \
	qt6-qtbase-devel \
	qt6-qttools-devel \
	qt6-qtsvg-devel \
	qt6-qtwayland-devel \
	qt6-qt5compat-devel \
	qt6-qtwebsockets-devel \
	qt6-qtimageformats-devel \
	extra-cmake-modules \
	cmake \
	extra-cmake-modules \
	qt6-qtbase-devel \
	qt6-qtbase-test \
	qt6-qtbase-concurrent \
	qt6-qt5compat-devel \
	qt6-qttools-devel \
	qt6-qtsvg-devel \
	qt6-qtwayland-devel \
	qt6-qtwebsockets-devel \
	qt6-qtimageformats-devel \
	argon2-devel \
	botan-devel \
	qrencode-devel \
	minizip-devel \
	readline-devel \
	qt6-qtbase-printsupport \
	qt6-qtnetworkauth-devel \
	argon2-devel \
	minizip-devel \
	readline-devel \
	asciidoctor \
	keyutils-devel
