#!/bin/bash
set +e

if [ $EUID -ne 0 ]; then
  echo "Please run as root!"
  exit
fi

REAL_USER=${SUDO_USER:-$(whoami)}

usermod -aG _seatd $REAL_USER
ln -s /etc/sv/acpid /var/service/
ln -s /etc/sv/chronyd /var/service/
ln -s /etc/sv/dbus /var/service/
ln -s /etc/sv/dhcpcd /var/service/
ln -s /etc/sv/seatd /var/service/
ln -s /etc/sv/bluetoothd /var/service/
ln -s /etc/sv/swayosd-libinput-backend /var/service/
ln -s /etc/sv/NetworkManager /var/service/
ln -s /etc/sv/sshd /var/service/
