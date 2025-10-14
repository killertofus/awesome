#!/usr/bin/env bash
doas emerge mirrorselect
doas mirrorselect -s3 -b10 -D
doas emerge -avtDUu @world
doas mv portage/* /etc/portage
doas emerge $(< packages.txt)
fc-cache -f
doas chsh -s $(which zsh)
doas emerge --depclean
rc-update del agetty.tty2
doas rc-update add ly piavpn libvirtd rustdesk
nvim > /dev/null 2>&1 &
./configs.sh
rm -rf $(pwd)
