#!/bin/bash
sudo apt purge "$DESKTOP_SESSION" -y
 #remove below when alacritty is in the mint repos
 add-apt-repository ppa:aslatter/ppa
 apt update
apt purge wayland youtube-dl warpinator vim-common snap rhythmbox p7zip libreoffice-base hypnotix emacsen-common
 apt install rofi fonts-hack fonts-noto-core curl picom ranger git gnupg lsb-release apt-transport-https policykit-1-gnome build-essential libpam0g-dev libxcb-xkb-dev ca-certificates xdotool wget awesome w3m vlc caja streamlink feh python-libtmux tmux qbittorrent ripgrep obs-studio gnome-disk-utility neovim alacritty xarchiver blueman unzip zsh flameshot timeshift lsd -y
distro=$(if echo " una bookworm vanessa focal jammy bullseye vera uma " | grep -q " $(lsb_release -sc) "; then echo $(lsb_release -sc); else echo focal; fi)

wget -O- https://deb.librewolf.net/keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/librewolf.gpg

 tee /etc/apt/sources.list.d/librewolf.sources << EOF > /dev/null
Types: deb
URIs: https://deb.librewolf.net
Suites: $distro
Components: main
Architectures: amd64
Signed-By: /usr/share/keyrings/librewolf.gpg
EOF

apt update

apt install librewolf -y


cd /usr/local/bin

curl -s https://api.github.com/repos/Chatterino/chatterino2/releases/latest \
| grep "-x86_64.AppImage" \
| cut -d : -f 2,3 \
| wget -qi - >
chmod +x Chatterino-x86_64.AppImage 

curl -s https://api.github.com/repos/streamlink/streamlink-twitch-gui/releases/latest \
| grep "browser_download_url 
.*-X86_64AppImage" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -\
| chmod +x "*-X86_64.AppImage"


curl -s https://api.github.com/repos/streamlink/streamlink-twitch-gui/releases/latest \
| grep "browser_download_url 
.*-x86_64.deb" \
| cut -d : -f 2,3 \
| tr -d \" \

wget -qO - https://apt.packages.shiftkey.dev/gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/shiftkey-packages.gpg > /dev/null
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/shiftkey-packages.gpg] https://apt.packages.shiftkey.dev/ubuntu/ any main" > /etc/apt/sources.list.d/shiftkey-packages.list'
apt update
apt install github-desktop

./Jdownloader2.sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --recurse-submodules https://github.com/fairyglade/ly
for dir in *ly
do
  (
  make
make run
make install installsystemd
systemctl enable ly.service
systemctl start ly.service
systemctl disable getty@tty2.service
  )
done
cd ..
cd config
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
znap pull
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p ~/.config/nvim
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/awesome
mkdir -p ~/.config/rofi
mkdir -p ~/.config/picom
for dir in *debian
do
  (
 mv .zshrc ~/.zshrc
  )
done
mv init.vim ~/.config/nvim/
mv alacritty.yml ~/.config/alacritty/
mv rc.lua ~/.config/awesome
mv rofi.rasi ~/.config/rofi
mv picom.conf ~/.config/picom
cd 
echo "RANGER_LOAD_DEFAULT_RC=false"
