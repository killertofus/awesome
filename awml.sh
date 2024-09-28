#!/usr/bin/env bash
sudo sed -i '/ParallelDownloads/s/^#//g' /etc/pacman.conf
sudo sed -i '/#MAKEFLAGS="5"/c\MAKEFLAGS="--jobs=$(nproc)"' /etc/makepkg.conf
sudo sed -i 's/debug/!debug/g' /etc/makepkg.conf
sudo sed -i '32 a ILoveCandy' /etc/pacman.conf
sudo sed -i '/Color/s/^#//g' /etc/pacman.conf
sudo -v
sudo pacman -S --needed git base-devel --noconfirm
git clone https://aur.archlinux.org/yay.git
makepkg -siD yay --noconfirm
sudo pacman -Syu --noconfirm
sudo pacman -S $(cat awmlpkgs.txt | cut -d' ' -f1) --noconfirm
fc-cache -f -v
chsh -s $(which zsh)
for word in $(cat ywmlpkgs.txt); do yay -S --noconfirm --mflags --skipinteg $word || true; done
yay --devel --save
sudo pacman -Qttdq | sudo pacman -Rns - --noconfirm
sudo systemctl enable sddm
sudo systemctl enable piavpn.service
sudo systemctl enable --now rustdesk
yay -Scc --noconfirm
nvim > /dev/null 2>&1 &
./gwml.sh
rm -rf $(pwd)
