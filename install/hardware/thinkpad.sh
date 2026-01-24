#!/bin/bash

set +e

if [ $EUID -ne 0 ]; then
	echo "Please run as root!"
	exit
fi

xbps-install -y \
	tp_smapi-dkms \
	tpacpi-bat \
	zcfan

sv down NetworkManager
sv down wpa_supplicant
rm /var/service/NetworkManager
rm /var/service/wpa_supplicant
ln -s /etc/sv/iwd /var/service/
xbps-remove -ROOo NetworkManager

grep -qxF "denyinterfaces wlp61s0" /etc/dhcpcd.conf || echo "denyinterfaces wlp61s0" | tee -a /etc/dhcpcd.conf

if [ ! -f /etc/iwd/main.conf ]; then
	sudo mkdir -p /etc/iwd
	printf "[General]\nEnableNetworkConfiguration=true\n" | sudo tee /etc/iwd/main.conf
	echo "/etc/iwd/main.conf Created"
else
	echo "File /etc/iwd/main.conf already exists..."
fi

echo "Thinkpad items are now installed..."
