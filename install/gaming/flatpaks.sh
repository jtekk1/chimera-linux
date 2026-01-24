#!/bin/bash

flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install --user -y \
  com.vysp3r.ProtonPlus \
  net.davidotek.pupgui2 \
  com.github.Matoking.protontricks \
  com.heroicgameslauncher.hgl \
  net.lutris.Lutris \
  com.discordapp.Discord \
  com.valvesoftware.Steam
