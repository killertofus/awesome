
sudo apt install rofi fonts-hack fonts-noto-core picom ranger git gnupg lsb-release apt-transport-https ca-certificates wget awesome w3m vlc caja streamlink python-libtmux tmux qbittorrent ripgrep obs-studio gnome-disk-utility neovim alacritty xarchiver unzip zsh flameshot timeshift lsd -y
distro=$(if echo " una bookworm vanessa focal jammy bullseye vera uma " | grep -q " $(lsb_release -sc) "; then echo $(lsb_release -sc); else echo focal; fi)

wget -O- https://deb.librewolf.net/keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/librewolf.gpg

sudo tee /etc/apt/sources.list.d/librewolf.sources << EOF > /dev/null
Types: deb
URIs: https://deb.librewolf.net
Suites: $distro
Components: main
Architectures: amd64
Signed-By: /usr/share/keyrings/librewolf.gpg
EOF

sudo apt update

sudo apt install librewolf -y


curl -s https://api.github.com/repos/Chatterino/chatterino2/releases/latest \
| grep "browser_download_url 
Chatterino-Ubuntu-.*deb" \
| cut -d : -f 2,3 \
| wget -qi -



curl -s https://api.github.com/repos/streamlink/streamlink-twitch-gui/releases/latest \
| grep "browser_download_url 
.*-X86_64AppImage" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -



curl -s https://api.github.com/repos/streamlink/streamlink-twitch-gui/releases/latest \
| grep "browser_download_url 
.*-x86_64.deb" \
| cut -d : -f 2,3 \
| tr -d \" \

wget -qO - https://apt.packages.shiftkey.dev/gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/shiftkey-packages.gpg > /dev/null
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/shiftkey-packages.gpg] https://apt.packages.shiftkey.dev/ubuntu/ any main" > /etc/apt/sources.list.d/shiftkey-packages.list'
sudo apt update
sudo apt install github-desktop

./Jdownloader2.sh

cd Config
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
mv rc.lua ~/.config/awesome
mv rofi.rasi ~/.config/awesome/home/configuration
cd 
mv Wallpaper.jpg ~/Pictures
echo "RANGER_LOAD_DEFAULT_RC=false"
