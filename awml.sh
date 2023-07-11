pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay --devel --save
sudo pacman -Syu
cd
yay -S  rofi chatterino2-git ranger git piavpn-bin wget awesome w3m vlc librewolf caja streamlink python-libtmux tmux streamlink-twitch-gui-bin qbittorrent jdownloader2 ripgrep rustdesk obs gnome-disk-utility ttf-nerd-fonts-symbols neovim alacritty sftpman-gtk xarchiver unzip zsh flameshot github-desktop-bin timeshift noto-fonts-cjk noto-fonts-emoji lsd  -y
cd Config
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
mv rc.lua ~/.config/awesome
mv rofi.rasi ~/.config/awesome/home/configuration
cd 
mv Wallpaper.jpg ~/Pictures
echo "RANGER_LOAD_DEFAULT_RC=false"
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
