#!/usr/bin/env bash
sudo zypper up
sudo sed -i 's/#download.max_concurrent_connections/download.max_concurrent_connections/g' /etc/zypp/zypp.conf
sudo env ZYPP_CURL2=1 zypper ref
sudo env ZYPP_PCK_PRELOAD=1 zypper dup
sudo zypper refresh
sudo systemctl set-default graphical.target
sed -i 's/dwm/dwl/g' configs.sh
sed -i '19d;20d' configs.sh
sed -i 's/feh/wayland-devel/g' packages.txt
sed -i 's/rofi/rofi-wayland/g' packages.txt
sed -i 's/xscreensaver/wlroots-devel/g' packages.txt
sed -i 's/picom/swww/g' packages.txt
sed -i 's/lxappearance/nwg-look/g' packages.txt
sed -i '2 a wayland-protocols-devel' packages.txt
sed -i 's/volumeicon/waybar/g' packages.txt
sed -i '4 a xdg-desktop-portal-wlr' packages.txt
sed -i '3 a xdg-desktop-portal-gtk' packages.txt
sudo zypper in -y $(cat packages.txt)
sudo opi -n -m $(cat obspackages.txt)
sudo -v
fc-cache -f
chsh -s $(which zsh)
zypper packages --orphaned | grep @System | cut -d '|' -f3 | xargs echo zypper rm -y
sudo systemctl enable ly rustdesk libvirtd.service libvirtd.socket
nvim > /dev/null 2>&1 &
./configs.sh
rm -rf $(pwd)
