pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay --devel --save
sudo pacman -Syu
cd -
yay -S  rofi chatterino2-git ttf-hack ttf-noto-fonts-ib picom ranger git piavpn-bin wget awesome w3m vlc librewolf caja streamlink python-libtmux tmux streamlink-twitch-gui-bin qbittorrent jdownloader2 ripgrep rustdesk obs gnome-disk-utility ttf-nerd-fonts-symbols neovim alacritty sftpman-gtk xarchiver unzip zsh flameshot github-desktop-bin timeshift noto-fonts-cjk noto-fonts-emoji lsd  -y
./gwml.sh
echo "RANGER_LOAD_DEFAULT_RC=false"
