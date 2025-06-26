#!/usr/bin/env bash
sudo zypper up
sudo zypper addrepo > obslinks.txt
sudo sed -i 's/#download.max_concurrent_connections/download.max_concurrent_connections/g' /etc/zypp/zypp.conf
sudo env ZYPP_CURL2=1 zypper ref
sudo env ZYPP_PCK_PRELOAD=1 zypper dup
sudo zypper refresh
sudo zypper install -y < packages.txt
sudo opi install -y < obs_packages.txt
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
