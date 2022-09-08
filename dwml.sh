pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
sudo pacman -Syu
yay -S ly -Y
yay -S git -Y
yay -S wget
yay -S plasma-desktop
git clone --recurse-submodules https://github.com/fairyglade/ly
cd ly
make
make run
make install install
systemctl enable ly.service
yay -S vlc -Y
yay -S librewolf -Y
wget https://www.privateinternetaccess.com/installer/pia-nm.sh
chmod +x pia-nm.sh
./pia-nn-sh
yay -S caja -Y
yay -S chatterino2-7tv-git -Y
yay -S vscodium -Y
sudo pacman -S streamlink -Y
yay -S streamlink-twitch-gui-bin -Y
yay -Syu
yay -S qbittorrent -Y
yay -S jdownloader2 -Y
yay -S rustdesk -Y
yay -S obs -Y
yay -S stacer -Y
yay -S gnome-disk-utility -Y
yay -S nano -Y
yay -S alacritty -Y
yay -S remmina -Y
yay -S p7zip-gui -Y
yay -S fish -Y
yay -S flameshot -Y
yay -S github-desktop-bin -Y
yay -S timeshift -Y
yay -S dash -Y
yay -S imlib2 -Y
yay -S noto-fonts-cjk -Y
yay -S noto-fonts-emoji -Y
