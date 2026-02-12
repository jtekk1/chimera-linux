#!/bin/bash
set -e

if [ "$(id -u)" -eq 0 ]; then
	echo "Please do not run as root!"
	exit 1
fi

doas usermod -aG wheel,audio,video,plugdev,video,network,users jtekk

# Pipewire reconfig of dinit with turnstile to avoid greetd user also launching these services
doas apk add '!pipewire-dinit-link' '!wireplumber-dinit-link'

if cat /etc/greetd/config.toml | grep "tuigreet" >/dev/null 2>&1; then
	echo "GreetD previously set for TUIGREET"
else
	doas cp ./install/DEs/tuigreet-config.toml /etc/greetd/config.toml
	echo "GREETD config has been set for TUIGREET"
fi

SERVICES="iwd dhcpcd greetd"
for SERVICE in $SERVICES; do
	if doas dinitctl status $SERVICE >/dev/null 2>&1; then
		echo "$SERVICE was already enabled"
	else
		doas dinitctl enable $SERVICE
	fi
done
