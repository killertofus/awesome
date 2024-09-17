#!/usr/bin/env bash
sudo sed -i '/ParallelDownloads/s/^#//g' /etc/pacman.conf
sudo sed -i '/#MAKEFLAGS="5"/c\MAKEFLAGS="--jobs=$(nproc)"' /etc/makepkg.conf
sudo sed -i 's/debug/!debug/g' /etc/makepkg.conf
sudo sed -i '32 a ILoveCandy' /etc/pacman.conf
sudo sed -i '/Color/s/^#//g' /etc/pacman.conf
sudo -v
sudo pacman -S --needed git base-devel reflector --noconfirm
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd -
sudo -v
sudo pacman -Syu --noconfirm
sudo -v
sudo pacman -S $(cat awmlpkgs.txt | cut -d' ' -f1) --noconfirm
fc-cache -f -v
chsh -s $(which zsh)
for word in $(cat ywmlpkgs.txt); do yay -S --noconfirm --mflags --skipinteg $word || true; done
yay --devel --save
sudo pacman -Qttdq | sudo pacman -Rns - --noconfirm
sudo systemctl enable ly
sudo systemctl enable piavpn.service
sudo systemctl enable libvirtd.service
sudo systemctl enable libvirtd.socket
yay -Scc --noconfirm
nvim > /dev/null 2>&1 &
./gwml.sh
sudo reflector --latest 20 --sort rate --save /etc/pacman.d/mirrorlist
