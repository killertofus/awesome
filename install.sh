#!/usr/bin/env bash
sudo sed -i '/ParallelDownloads/s/^#//g' /etc/pacman.conf
sudo sed -i '/#MAKEFLAGS="5"/c\MAKEFLAGS="--jobs=$(nproc)"' /etc/makepkg.conf
sudo sed -i '32 a ILoveCandy' /etc/pacman.conf
sudo sed -i '/Color/s/^#//g' /etc/pacman.conf
sudo -v
sudo pacman -S --needed git base-devel --noconfirm
git clone https://aur.archlinux.org/yay.git
makepkg -siD yay --noconfirm
sudo pacman -Syu --noconfirm
sudo pacman -S $(cat packages.txt | cut -d' ' -f1) --noconfirm
fc-cache -f -v
chsh -s $(which zsh)
for word in $(cat aurpackages.txt); do yay -S --noconfirm --mflags --skipinteg $word || true; done
yay --devel --save
sudo pacman -Qttdq | sudo pacman -Rns - --noconfirm
sudo systemctl enable ly
sudo systemctl enable piavpn.service
sudo systemctl enable libvirtd.service
sudo systemctl enable libvirtd.socket
sudo systemctl enable --now rustdesk
yay -Scc --noconfirm
nvim > /dev/null 2>&1 &
./configs.sh
rm -rf $(pwd)
