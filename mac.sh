#!/usr/bin/env sh
#
bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew cask install alacritty
brew cask install tmux
brew install -cask -private-internet-access
brew install --cask librewolf
brew install --cask iglance
brew tap jeffreywildman/homebrew-virt-manager
brew install virt-viewer
virt-viewer --version
brew install --cask db-browser-for-sqlite
