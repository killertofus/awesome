#!/usr/bin/env sh
export XDG_DATA_HOME=""$HOME"/.local/share"
export ZSH="$XDG_DATA_HOME""/oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
mv themes "$XDG_DATA_HOME"
cp -r .config ~/
mv .zshrc ~/
mv icons "$XDG_DATA_HOME"
gsettings set org.cinnamon.desktop.privacy remember-recent-files false
gsettings set org.nemo.preferences show-hidden-files true
wget https://github.com/dracula/zsh/archive/master.zip
unzip master.zip
mv zsh-master/lib zsh-master/dracula.zsh-theme "$XDG_DATA_HOME"/oh-my-zsh/themes
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-"$XDG_DATA_HOME"/oh-my-zsh/custom}/plugins/zsh-autosuggestions
export WINEPREFIX="$XDG_DATA_HOME"/wine
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export XCURSOR_PATH=/usr/share/icons:$XDG_DATA_HOME/icons
