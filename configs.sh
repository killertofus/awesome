#!/usr/bin/env sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
mv themes ~/.local/share
cp -r config ~/
mv icons ~/.local/share
mv .zshrc ~/
sudo mkdir -p /usr/share/xsessionse
sudo mv dwm.desktop /usr/share/xsessions/
gsettings set org.cinnamon.desktop.privacy remember-recent-files false
gsettings set org.nemo.preferences show-hidden-files true
mv .xinitrc ~/
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
wget https://github.com/dracula/zsh/archive/master.zip
unzip master.zip
mv zsh-master/lib zsh-master/dracula.zsh-theme ~/.oh-my-zsh/themes
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
~/.config/tmux/plugins/tpm/scripts/install_plugins.sh
make -C ~/.config/dwm/ clean
sudo make -C ~/.config/dwm/ clean install
make -C ~/.config/dwm/slstatus/ clean
sudo make -C ~/.config/dwm/slstatus/ clean install
export ZSH="$XDG_DATA_HOME"/oh-my-zsh
export WINEPREFIX="$XDG_DATA_HOME"/wine
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export XCURSOR_PATH=/usr/share/icons:$XDG_DATA_HOME/icons
