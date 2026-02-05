#!/bin/sh

set +e

echo "Setting up Repos!"
sleep 2
doas ./install/repos.sh

echo "Setting up Core items!"
sleep 2
doas ./install/core.sh

echo "Setting up system"
sleep 2
doas ./install/cli.sh
doas ./install/tuis.sh
doas ./install/tools.sh
doas ./install/fonts.sh
doas ./install/guis.sh
doas ./install/extras.sh

# echo "Setting up seatd and dbus!"
# sleep 2
# ./install/services.sh

echo "Setting up Desktop"
doas ./install/dev-tools.sh
doas ./install/desktop-env.sh
doas ./install/DEs/mangowc.sh
doas ./install/hardware/intel.sh

doas update-initramfs -u -k all
./install/apps/superfile-install.sh

echo "DONE!!!"
echo "Welcome to the CHIMERA!"
sleep 2
