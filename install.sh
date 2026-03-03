#!/usr/bin/env bash
doas emerge mirrorselect
doas emaint sync
doas mirrorselect -i -c USA
doas emerge -avtDUu @world
doas cp -r portage/* /etc/portage
doas emaint sync
doas emerge $(< packages.txt)
fc-cache -f
doas chsh -s $(which zsh)
doas emerge --depclean
rc-update del agetty.tty2
rc-update add dbus default
rc-update add display-manager default
doas rc-update add ly piavpn libvirtd rustdesk
nvim > /dev/null 2>&1 &
./configs.sh
rm -rf $(pwd)
