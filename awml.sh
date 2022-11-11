pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
sudo pacman -Syu
cd
yay -S  rofi chatterino2-git vscodium git wget awesome sddm vlc librewolf caja streamlink streamlink-twitch-gui-bin qbittorrent jdownloader2 rustdesk obs gnome-disk-utility neovim alacritty remmina p7zip-gui zsh flameshot github-desktop-bin timeshift noto-fonts-cjk noto-fonts-emoji -y
wget https://installers.privateinternetaccess.com/download/pia-linux-3.3.1-06924.run
chmod +x pia-linux-3.3.1-06924.run
sh ./pia-linux-3.3.1-06924.run
sudo systemctl enable sddm.service
cd Config
mv rc.lua ~/.config/awesome
mv rofi.rasi ~/.config/awesome/home/configuration
cd 
mv Wallpaper.jpg ~/Pictures
