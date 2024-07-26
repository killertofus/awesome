#!/usr/bin/env bash
sed -i 's/dwm/dwl/g' gwml.sh
sed -i 's/xsessions/wayland-sessions/g' gwml.sh
sed -i 's/.xinitrc/startup.sh/g' gwml.sh
sed -i '22d;23d' gwml.sh
sed -i 's/feh/wayland/g' awmlpkgs.txt
sed -i 's/xscreensaver/wlroots/g' awmlpkgs.txt
sed -i 's/picom/swww/g' awmlpkgs.txt
sed -i 's/volumeicon/waybar/g' awmlpkgs.txt
sudo sed -i '/ParallelDownloads/s/^#//g' /etc/pacman.conf
sudo sed -i '/#MAKEFLAGS="5"/c\MAKEFLAGS="--jobs=$(nproc)"' /etc/makepkg.conf
sudo sed -i '32 a ILoveCandy' /etc/pacman.conf
sudo sed -i '/Color/s/^#//g' /etc/pacman.conf
sudo mkdir -p /usr/share/wayland-sessions
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
sudo systemctl enable --now piavpn.service
swww-daemon
swww img ~/.config/dwl/wallpaper.jpg
yay -Scc 
chsh -s $(which zsh)
fc-cache -f -v
./gwml.sh
