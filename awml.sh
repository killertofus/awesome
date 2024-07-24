#!/usr/bin/env bash
sudo pacman -S --needed git base-devel reflector
sudo reflector --latest 200 --sort rate --save /etc/pacman.d/mirrorlist
sudo -v
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd -
sudo -v
sudo sed -i '/ParallelDownloads/s/^#//g' /etc/pacman.conf
sudo sed -i '/#MAKEFLAGS="5"/c\MAKEFLAGS="--jobs=$(nproc)"' /etc/makepkg.conf
sudo sed -i '32 a ILoveCandy' /etc/pacman.conf
sudo sed -i '/Color/s/^#//g' /etc/pacman.conf
sudo -v
sudo pacman -S $(cat awmlpkgs.txt | cut -d' ' -f1)
for word in $(cat ywmlpkgs.txt); do yay -S --noconfirm --mflags --skipinteg $word || true; done
yay --devel --save
sudo systemctl enable ly
sudo pacman -Syu
sudo pacman -Qttdq | sudo pacman -Rns -
sudo systemctl enable --now piavpn.service
yay -Scc 
chsh -s $(which zsh)
fc-cache -f -v
./gwml.sh
