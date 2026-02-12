#!/bin/bash

set -e

if [ "$(id -u)" -eq 0 ]; then
	echo "Please do not run with doas/sudo, or as root"
	exit 1
fi

doas apk add -lu --interactive=no \
	nodejs \
	rust \
	cargo \
	python \
	uv \
	cmake \
	gawk \
	ruby \
	gcc \
	meson \
	ninja \
	go \
	lua5.4 \
	tree-sitter-lua

echo "Tools installed ..."
