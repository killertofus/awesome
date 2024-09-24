#!/usr/bin/env sh
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install < macpackages.txt
pip install --user libtmux
mv .zshrc ~/
nvim > /dev/null 2>&1 &
mv wallpaper.jpg ~/Pictures
./gwml.sh
rm -rf $(pwd)
