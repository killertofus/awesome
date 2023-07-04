pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay --devel --save
sudo pacman -Syu
cd
yay -S  rofi chatterino2-git git piavpn-bin wget awesome vlc librewolf caja streamlink python-libtmux ?tmux streamlink-twitch-gui-bin qbittorrent jdownloader2 ripgrep rustdesk obs gnome-disk-utility neovim alacritty sftpman-gtk xarchiver unzip zsh flameshot github-desktop-bin timeshift noto-fonts-cjk noto-fonts-emoji lsd -y
cd Config
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
mv rc.lua ~/.config/awesome
mv rofi.rasi ~/.config/awesome/home/configuration
cd 
mv Wallpaper.jpg ~/Pictures
