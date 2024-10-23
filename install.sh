#!/usr/bin/env bash
sudo wget -p /usr/share/fonts/JetBrains
sudo wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz  --directory-prefix=/usr/share/fonts/JetBrains
sudo tar -xvf /usr/share/fonts/JetBrains/JetBrainsMono.tar.xz -C /usr/share/fonts/JetBrains/
sudo rm -rf /usr/share/fonts/JetBrains/JetBrainsMono.tar.xz /usr/share/fonts/JetBrains/*.md
sudo wget -p /usr/share/fonts/Iosevka
sudo wget -p /usr/share/fonts/Iosevka
sudo wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Iosevka.tar.xz --directory-prefix=/usr/share/fonts/Iosevka/
sudo tar -xvf /usr/share/fonts/Iosevka/Iosevka.tar.xz -C /usr/share/fonts/Iosevka/
sudo rm -rf /usr/share/fonts/Iosevka/Iosevka.tar.xz /usr/share/fonts/Iosevka/*.md
sudo apt update
xargs sudo apt install < packages.txt -y
fc-cache -fv
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo flatpak install -y --noninteractive rustdesk
balooctl6 suspend
balooctl6 disable
balooctl6 purge
chsh -s $(which zsh)
nvim > /dev/null 2>&1 &
./configs.sh && sudo apt update && sudo apt upgrade -y && sudo apt clean && sudo apt autoclean && sudo apt autoremove -y
sudo apt purge plasma-discover kdeconnect -y
rm -rf $(pwd)
