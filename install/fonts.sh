#!/bin/bash

set -e

if [ "$(id -u)" -eq 0 ]; then
	echo "Please do not run with doas, as root, or with sudo!"
	exit
fi

doas apk add -lu --interactive=no \
	fonts-font-awesome-otf \
	fonts-nerd-caskaydia-cove \
	fonts-nerd-caskaydia-mono \
	fonts-nerd-daddy-time-mono \
	fonts-nerd-dejavu-sans-mono \
	fonts-nerd-jetbrains-mono \
	fonts-nerd-noto \
	font-terminus

echo "Fonts installed ... "
echo "Setting up console fonts... "

doas sed -i '' 's/^FONTFACE=.*/FONTFACE="Terminus"/' /etc/default/console-setup
doas sed -i '' 's/^FONSIZE=.*/FONTSIZE="16x32"/' /etc/default/console-setup
doas setupcon
