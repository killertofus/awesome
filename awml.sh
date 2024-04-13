#!/usr/bin/env bash
sudo pacman -S --needed git base-devel
sudo mv config/awesome.desktop /usr/share/xsessions
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd -
sudo sed -i '/ParallelDownloads/s/^#//g' /etc/pacman.conf
sudo sed -i '/color/s/^#//g' /etc/pacman.conf
for word in $(cat ywmlpkgs.txt); do yay -S --noconfirm --mflags --skipinteg $word || true; done
sudo pacman -S $(cat awmlpkgs.txt | cut -d' ' -f1)
sudo systemctl enable ly
yay --devel --save
sudo pacman -Syu
sudo pacman -Qttdq | sudo pacman -Rns -
sudo systemctl enable --now piavpn.service
yay -Scc 
sudo reflector --latest 200 --sort rate --save /etc/pacman.d/mirrorlist
chsh -s $(which zsh)
fc-cache -f -v
./gwml.sh
