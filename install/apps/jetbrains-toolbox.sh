#!/bin/bash

mkdir -p ~/AppImages
wget -P ~/AppImages https://download.jetbrains.com/toolbox/jetbrains-toolbox-3.2.0.65851.tar.gz
cd ~/AppImages/
tar -xvf jetbrains-toolbox-3.2.0.65851.tar.gz

echo "Jetbrains Toolbox is set!"
sleep 1
