#!/bin/bash

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color (Reset)

CONFIG_FILE="/etc/doas.conf"
USER_RULE="permit nopass $USER"

case $1 in
"deepspace" | "thinkpad")
	echo "Setting PC_HOST as $1"
	PC_HOST=$1
	;;

*)
	echo "This only supports 'deepspace' or 'thinkpad'. Exiting!"
	exit 1
	;;
esac

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
  echo -e "${BLUE}Starting Tekk's Chimera Installer Script...${NC}"
	if [ grep -qF "$USER_RULE" "$CONFIG_FILE" ]; then
		echo -e "${GREEN}Privilege already exists. Skipping add.${NC}"
	else
		echo "$USER_RULE" | doas tee -a "$CONFIG_FILE" >/dev/null
	fi
fi

echo -e "${GREEN}Setting up Repos!${NC}"
./install/core/repos.sh >/dev/null

echo -e "${GREEN}Setting up Core items!${NC}"
./install/core/core.sh >/dev/null

echo -e "${GREEN}Setting up Cli items${NC}"
./install/system/cli.sh >/dev/null

echo -e "${GREEN}Setting up TUIs${NC}"
./install/system/tuis.sh >/dev/null

echo -e "${GREEN}Setting up Tools${NC}"
./install/system/tools.sh >/dev/null

echo -e "${GREEN}Setting up Fonts${NC}"
./install/system/fonts.sh >/dev/null

echo -e "${GREEN}Setting up GUIs${NC}"
./install/system/guis.sh >/dev/null

echo -e "${GREEN}Setting up Extras${NC}"
./install/system/extras.sh >/dev/null

echo -e "${GREEN}Setting up DevTools${NC}"
./install/tools/dev-tools.sh >/dev/null

echo -e "${GREEN}Setting up compiling tools${NC}"
./install/tools/compiling-tools.sh >/dev/null

echo -e "${GREEN}Setting up desktop env${NC}"
./install/desktop/desktop-env.sh >/dev/null

echo -e "${GREEN}Compiling MangoWC Items${NC}"
./install/desktop/mangowc.sh >/dev/null

echo -e "${GREEN}Setting up SuperFile and Ble.sh Apps${NC}"
./install/apps/superfile-install.sh >/dev/null
./install/apps/ble.sh >/dev/null

echo -e "${GREEN}Installing Flatpaks (LITE)${NC}"
./install/apps/flatpaks-lite.sh >/dev/null

if [ "$1" == "deepspace" ]; then
  echo -e "${GREEN}Setting up Deepspace drivers!${NC}"
  ./install/hardware/amd.sh >/dev/null
  echo -e "${GREEN}Setting up Deepspace for gaming!${NC}"
  ./install/gaming/gaming.sh >/dev/null
  ./install/gaming/flatpaks.sh >/dev/null
elif [ "$1" == "thinkpad" ]; then
  echo -e "${GREEN}Setting up Thinkpad drivers${NC}" 
  ./install/hardware/intel.sh
fi

echo -e "${GREEN}Setting up services!${NC}"
./install/services/services.sh >/dev/null

echo -e "${GREEN}Updating initramfs${NC}"
doas update-initramfs -u -k all >/dev/null

echo -e "${GREEN}DONE!!!${NC}"
echo -e "${BLUE}Welcome to the CHIMERA!${NC}"

read -p "System needs to reboot.  Press [Enter] to restart now..."
loginctl reboot
