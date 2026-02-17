#!/bin/bash

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color (Reset)

CONFIG_FILE="/etc/doas.conf"
USER_RULE="permit nopass $USER"

cleanup() {
	echo -e "${GREEN}Cleaning up: removing temporary priviledge...${NC}"
	doas sed -i '' "/$USER_RULE/d" "$CONFIG_FILE"
}

trap cleanup EXIT INT TERM

if [ "$(id -u)" -eq 0 ]; then
	echo -e "${RED}Please do not run with doas, as root, or with sudo!${NC}"
	exit 1
fi

echo -e "${BLUE}Authenticating for administrative tasks...${NC}"
if ! doas true; then
	echo -e "${RED}Authentication failed. Exiting.${NC}"
	exit 1
else
	if [ grep -qF "$USER_RULE" "$CONFIG_FILE" ]; then
		echo -e "${GREEN}Privilege already exists. Skipping add.${NC}"
	else
		echo "$USER_RULE" | doas tee -a "$CONFIG_FILE" >/dev/null
	fi
fi

echo -e "${GREEN}Starting automation...${NC}"

echo -e "${GREEN}Setting up Repos!${NC}"
sleep 2
./install/core/repos.sh

echo -e "${GREEN}Setting up Core items!${NC}"
sleep 2
./install/core/core.sh

echo -e "${GREEN}Setting up system${NC}"
sleep 2
./install/system/cli.sh
./install/system/tuis.sh
./install/system/tools.sh
./install/system/fonts.sh
./install/system/guis.sh
./install/system/extras.sh

echo -e "${GREEN}Setting up DevTools, and DKMS${NC}"
./install/tools/dev-tools.sh

echo -e "${GREEN}Setting up Apps to compile${NC}"
./install/tools/compiling-tools.sh

echo -e "${GREEN}Compiling MangoWC Items${NC}"
./install/desktop/desktop-env.sh
./install/desktop/mangowc.sh

echo -e "${GREEN}Setting up DEEPSPACE to compile${NC}"
./install/hardware/amd.sh
doas update-initramfs -u -k all

echo -e "${GREEN}Setting up External Apps${NC}"
./install/apps/superfile-install.sh
./install/apps/ble.sh


echo -e "${GREEN}Setting up services!${NC}"
sleep 2
#./install/services.sh

echo -e "${GREEN}Installing Flatpaks (LITE)${nc}"
./install/apps/flatpaks-lite.sh

echo -e "${GREEN}DONE!!!${NC}"
echo -e "${BLUE}Welcome to the CHIMERA!${NC}"
sleep 2

read -p "System needs to reboot.  Press [Enter] to restart now..."
loginctl reboot
