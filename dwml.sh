pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
sudo pacman -Syu
yay -S ly -y
yay -S git -y
yay -S wget
git clone dwm
git clone git://git.suckless.org/st
cd st
sudo make clean install
cd ..
cd dwm
sudo make clean install
yay -S vlc -y
yay -S librewolf -y
wget https://www.privateinternetaccess.com/installer/pia-nm.sh
chmod +x pia-nm.sh
./pia-nn-sh
yay -S caja -y
yay -S chatterino2-7tv-git -y
yay -S vscodium -y
sudo pacman -S streamlink
yay -S streamlink-twitch-gui-bin -y
yay -Syu
yay -S qbittorrent -y
yay -S jdownloader2 -y
yay -S rustdesk -y
yay -S obs
yay -S stacer -y
yay -S gnome-disk-utility -y
yay -S nano -y
yay -S alacritty -y
yay -S remmina -y
yay -S p7zip-gui -y
yay -S fish -y
yay -S flameshot -y
yay -S github-desktop-bin -y
yay -S timeshift
yay -S dash
yay -S imlib2
yay -S noto-fonts-cjk
yay -S noto-fonts-emoji
yay -S  nerd-fonts-jetbrains-mono
yay -S picom
yay -S feh
yay -S rofi
