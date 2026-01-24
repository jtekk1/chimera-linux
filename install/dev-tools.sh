#!/bin/bash

set +e

if [ $EUID -ne 0 ]; then
	echo "Please run as root!"
	exit
fi

apk add \
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
	ninja

echo "Tools installed ..."
