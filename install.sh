#!/usr/bin/env bash
doas sed -i '11 a ILoveCandy' /etc/pacman.conf
doas sed -i '12 a ILoveCandy' /etc/pacman.conf
doas emerge mirrorselect
doas eselect repository enable librewolf zugaina guru
doas mirrorselect -s3 -b10 -D
doas emerge --avtDUu @world
doas emerge $(cat packages.txt)
fc-cache -f
doas chsh -s $(which zsh)
doas emerge --depclean
doas rc-update add ly piavpn libvirtd.socket libvirtd.service rustdesk
nvim > /dev/null 2>&1 &
./configs.sh
rm -rf $(pwd)
