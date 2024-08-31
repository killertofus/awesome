#!/usr/bin/env bash
sed -i 's/dwm/dwl/g' gwml.sh
sed -i 's/xsessions/wayland-sessions/g' gwml.sh
sed -i 's/.xinitrc/startup.sh/g' gwml.sh
sed -i '23d;24d' gwml.sh
sed -i 's/feh/wayland/g' awmlpkgs.txt
sed -i 's/xscreensaver/wlroots/g' awmlpkgs.txt
sed -i 's/picom/swww/g' awmlpkgs.txt
sed -i 's/lxappearance/nwg-look/g' awmlpkgs.txt
sed -i '1 a wlroots0.17' awmlpkgs.txt
sed -i '2 a wayland-protocols' awmlpkgs.txt
sed -i 's/volumeicon/waybar/g' awmlpkgs.txt
sudo sed -i '/ParallelDownloads/s/^#//g' /etc/pacman.conf
sudo sed -i '/#MAKEFLAGS="5"/c\MAKEFLAGS="--jobs=$(nproc)"' /etc/makepkg.conf
sudo sed -i '32 a ILoveCandy' /etc/pacman.conf
sudo sed -i '/Color/s/^#//g' /etc/pacman.conf
echo 'EXPORT PKG_CONFIG_PATH=/usr/lib/wlroots0.17/pkgconfig'
sudo mkdir -p /usr/share/wayland-sessions
sudo -v
sudo pacman -S --needed git base-devel reflector --noconfirm
sudo reflector --latest 200 --sort rate --save /etc/pacman.d/mirrorlist
sudo -v
sudo pacman -Syu --noconfirm
sudo -v
sudo pacman -S $(cat awmlpkgs.txt | cut -d' ' -f1) --noconfirm
fc-cache -f -v
chsh -s $(which zsh)
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd -
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
