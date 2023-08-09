
sudo apt install rofi chatterino2-git ttf-hack ttf-noto-fonts-ib picom ranger git piavpn-bin wget awesome w3m vlc librewolf caja streamlink python-libtmux tmux streamlink-twitch-gui-bin qbittorrent jdownloader2 ripgrep rustdesk obs gnome-disk-utility ttf-nerd-fonts-symbols neovim alacritty sftpman-gtk xarchiver unzip zsh flameshot github-desktop-bin timeshift noto-fonts-cjk noto-fonts-emoji lsd  -y
curl -s https://api.github.com/repos/Chatterino/chatterino2/releases/latest \
| grep "browser_download_url 
Chatterino-Ubuntu-.*deb" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -

cd Config
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
mv rc.lua ~/.config/awesome
mv rofi.rasi ~/.config/awesome/home/configuration
cd 
mv Wallpaper.jpg ~/Pictures
echo "RANGER_LOAD_DEFAULT_RC=false"
