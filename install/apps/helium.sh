#!/bin/bash

mkdir -p ~/AppImages
wget -P ~/AppImages https://github.com/imputnet/helium-linux/releases/download/0.7.7.1/helium-0.7.7.1-x86_64.AppImage
mv ~/AppImages/helium-0.7.7.1-x86_64.AppImage ~/AppImages/helium.appimage
chmod a+x ~/AppImages/helium.appimage

echo "Helium Browser is set!"
sleep 1
