#!/usr/bin/env bash
sudo sed -i '/ParallelDownloads/s/^#//g' /etc/pacman.conf
sudo sed -i '/#MAKEFLAGS="5"/c\MAKEFLAGS="--jobs=$(nproc)"' /etc/makepkg.conf
sudo sed -i 's/debug/!debug/g' /etc/makepkg.conf
sudo sed -i '32 a ILoveCandy' /etc/pacman.conf
sudo sed -i '/Color/s/^#//g' /etc/pacman.conf
sudo mkdir -p /usr/share/xsessions
sudo -v
sudo pacman -S --needed git base-devel reflector --noconfirm
sudo reflector --latest 200 --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syu --noconfirm
sudo -v
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd -
sudo -v
sudo pacman -S $(cat awmlpkgs.txt | cut -d' ' -f1) --noconfirm
for word in $(cat ywmlpkgs.txt); do yay -S --noconfirm --mflags --skipinteg $word || true; done
yay --devel --save
sudo pacman -Qttdq | sudo pacman -Rns - --noconfirm
sudo systemctl enable ly
sudo systemctl enable piavpn.service
sudo systemctl enable libvirtd.service
sudo systemctl enable libvirtd.socket
nvim > /dev/null 2>&1 &
yay -Scc 
chsh -s $(which zsh)
fc-cache -f -v
./gwml.sh
