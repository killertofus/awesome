#!/usr/bin/env sh
mv themes "$XDG_DATA_HOME"
cp -r .config ~/
mv .zshrc ~/
mv icons "$XDG_DATA_HOME"
find ~/.local/share -name '*.zip' -exec sh -c 'unzip -d "${1%.*}" "$1"' _ {} \;
sudo mv awesome.desktop /usr/share/xsessions/
gsettings set org.cinnamon.desktop.privacy remember-recent-files false
gsettings set org.nemo.preferences show-hidden-files true
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
~/.config/tmux/plugins/tpm/scripts/install_plugins.sh
