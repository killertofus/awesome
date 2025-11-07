#!/usr/bin/env bash
sudo sed -i 's/debug/!debug/g' /etc/makepkg.conf
sudo sed -i '/#MAKEFLAGS="5"/c\MAKEFLAGS="--jobs=$(nproc)"' /etc/makepkg.conf
sudo sed -i '32 a ILoveCandy' /etc/pacman.conf
sudo sed -i '/Color/s/^#//g' /etc/pacman.conf
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
sudo systemctl enable ly piavpn libvirtd.socket libvirtd.service rustdesk
yay -Scc --noconfirm
./configs.sh
rm -rf $(pwd)
