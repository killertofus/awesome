#!/usr/bin/env sh
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew tap zegervdv/zathura
brew install < macpackages.txt
pip install --user libtmux
mkdir -p $(brew --prefix zathura)/lib/zathura
ln -s $(brew --prefix zathura-pdf-poppler)/libpdf-poppler.dylib $(brew --prefix zathura)/lib/zathura/libpdf-poppler.dylib
mv .zshrc ~/
nvim > /dev/null 2>&1 &
mv wallpaper.jpg ~/Pictures
./gwml.sh
rm -rf $(pwd)
