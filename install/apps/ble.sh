#!/bin/bash

git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git blesh
make -C blesh install PREFIX=/home/$USER/.local
chown $USER /home/$USER/.local/share/blesh
chown $USER /home/$USER/.local/share/doc/blesh
rm -rf ./blesh
