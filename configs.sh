#!/usr/bin/env sh
mv themes ~/"$XDG_DATA_HOME"
mv .zshrc ~/
cp -r .config ~/
mv icons ~/"$XDG_DATA_HOME"
gsettings set org.cinnamon.desktop.privacy remember-recent-files false
gsettings set org.nemo.preferences show-hidden-files true
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export XCURSOR_PATH=/usr/share/icons:$XDG_DATA_HOME/icons
