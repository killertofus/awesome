#!/usr/bin/env bash
sudo sed -i 's/#download.max_concurrent_connections/download.max_concurrent_connections/g' /etc/zypp/zypp.conf
sudo env ZYPP_CURL2=1 zypper ref
sudo env ZYPP_PCK_PRELOAD=1 zypper dup -y
sudo zypper up -y
sudo zypper in -y $(cat packages.txt)
sudo opi in -y < $(cat obspackages.txt)
sudo systemctl set-default graphical.target
sudo mkdir -p /usr/share/xsessions/
sudo -v
fc-cache -f
chsh -s $(which zsh)
zypper packages --orphaned | grep @System | cut -d '|' -f3 | xargs echo zypper rm -y
sudo systemctl enable ly libvirtd.socket libvirtd.service rustdesk
nvim > /dev/null 2>&1 &
./configs.sh
rm -rf $(pwd)
