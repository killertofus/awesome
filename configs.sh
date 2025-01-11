#!/usr/bin/env sh
ZSH="$XDG_CONFIG_HOME/oh-my-zsh" sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
mv themes ~/.local/share
mv .zshrc ~/
cp -r .config ~/
mv icons ~/.local/share
gsettings set org.cinnamon.desktop.privacy remember-recent-files false
gsettings set org.nemo.preferences show-hidden-files true
wget https://github.com/dracula/zsh/archive/master.zip
unzip master.zip
mv zsh-master/lib zsh-master/dracula.zsh-theme ~/.config/oh-my-zsh/themes
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.config/oh-my-zsh/custom}/plugins/zsh-autosuggestions
export ZSH="$XDG_DATA_HOME"/oh-my-zsh
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export XCURSOR_PATH=/usr/share/icons:$XDG_DATA_HOME/icons
