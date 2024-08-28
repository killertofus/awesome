#!/usr/bin/env sh
brew install < macpackages.txt
pip install --user libtmux
mv .zshrc ~/
nvim > /dev/null 2>&1 &
mv wallpaper.jpg ~/Pictures
./gwml.sh
