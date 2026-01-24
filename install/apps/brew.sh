#!/bin/bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# universal blue tap
brew tap ublue-os/tap
brew tap ublue-os/experimental-tap

brew install --cask jetbrains-toolbox-linux
brew install --cask lm-studio-linux
brew install --cask cursor-linux
 
