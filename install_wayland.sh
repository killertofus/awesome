#!/usr/bin/env bash
sed -i 's/feh/wayland/g' packages.txt
sed -i 's/rofi/rofi-wayland/g' packages.txt
sed -i '3d' packages.txt
sed -i 's/xscreensaver/wlroots0.18/g' packages.txt
sed -i 's/picom/swww/g' packages.txt
sed -i 's/lxappearance/nwg-look/g' packages.txt
sed -i '2 a wayland-protocols' packages.txt
sed -i '2 a cwc' aurpackages.txt
sed -i 's/volumeicon/waybar/g' packages.txt
sed -i '4 a xdg-desktop-portal-wlr' packages.txt
sed -i '3 a xdg-desktop-portal-gtk' packages.txt
sudo sed -i 's/debug/!debug/g' /etc/makepkg.conf
sudo sed -i '/#MAKEFLAGS="5"/c\MAKEFLAGS="--jobs=$(nproc)"' /etc/makepkg.conf
sudo sed -i '32 a ILoveCandy' /etc/pacman.conf
sudo sed -i '/Color/s/^#//g' /etc/pacman.conf
sudo -v
sudo pacman -S --needed git base-devel --noconfirm
git clone https://aur.archlinux.org/yay.git
makepkg -siD yay --noconfirm
sudo pacman -Syu --noconfirm
sudo pacman -S $(cat packages.txt | cut -d' ' -f1) --noconfirm
fc-cache -f
chsh -s $(which zsh)
for word in $(cat aurpackages.txt); do yay -S --noconfirm --mflags --skipinteg $word || true; done
yay --devel --save
sudo pacman -Qttdq | sudo pacman -Rns - --noconfirm
sudo systemctl enable ly piavpn libvirtd.socket libvirtd.service rustdesk
yay -Scc --noconfirm
nvim > /dev/null 2>&1 &
./configs.sh
rm -rf $(pwd)
