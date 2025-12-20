#!/usr/bin/env bash
sudo sed -i -e  '/#MAKEFLAGS="-j2"/c\MAKEFLAGS="--jobs=$(nproc)"' /etc/makepkg.conf -e '93,95s/debug/!debug/g' /etc/makepkg.conf -e '/#NPROC="2"/c\ NPROC="$(nproc)"'/etc/makepkg.conf
sudo sed -i -e '/Color/s/^#//g' /etc/pacman.conf -e '32 a ILoveCandy' /etc/pacman.conf
sudo -v
git clone https://aur.archlinux.org/yay.git
makepkg -siD yay --noconfirm
sudo pacman -Syu --noconfirm
sudo pacman -S - < packages.txt --noconfirm
fc-cache -f
chsh -s $(which zsh)
yay -S - < aurpackages.txt --noconfirm --mflags --skipinteg
yay --devel --save
sudo pacman -Qttdq | sudo pacman -Rns - --noconfirm
sudo systemctl disable getty@tty2
sudo systemctl enable ly@tty2 piavpn libvirtd.socket libvirtd.service rustdesk
yay -Scc --noconfirm
./configs.sh
rm -rf $(pwd)
