#!/bin/bash

flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install --user -y \
  it.mijorus.gearlever \
  com.bitwarden.desktop \
  com.discordapp.Discord \
  com.spotify.Client \
  dev.zed.Zed \
  md.obsidian.Obsidian \
  org.dupot.easyflatpak \
  com.rafaelmardojai.Blanket
