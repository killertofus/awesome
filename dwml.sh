pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
sudo pacman -Syu
cd
yay -S chatterino2-7tv-git -Y
yay -S vscodium -Y
yay -S git -Y
yay -S wget
yay -S plasma-desktop
yay -S sddm
sudo systemctl enable sddm.service
yay -S vlc -Y
yay -S librewolf -Y
wget https://installers.privateinternetaccess.com/download/pia-linux-3.3.1-06924.run
chmod +x pia-linux-3.3.1-06924.run
sh ./pia-linux-3.3.1-06924.run
yay -S caja -Y
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
