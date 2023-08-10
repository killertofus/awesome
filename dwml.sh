apt install xdotool
xdotool key control alt F5
kill echo $XDG_CURRENT_DESKTOP
 apt purge echo $XDG_CURRENT_DESKTOP -y
 #remove below when alacritty is in the mint repos
 add-apt-repository ppa:aslatter/ppa
 apt update
apt purge wayland youtube-dl warpinator vim-comon snap rhythmbox p7zip libreoffice-base hypnotix emacsen-common
 apt install rofi fonts-hack fonts-noto-core curl picom ranger git gnupg lsb-release apt-transport-https policykit-1-gnome ca-certificates xdotool wget awesome w3m vlc caja streamlink feh python-libtmux tmux qbittorrent ripgrep obs-studio gnome-disk-utility neovim alacritty xarchiver blueman unzip zsh flameshot timeshift lsd -y
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
apt update
apt install github-desktop

./Jdownloader2.sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cd config
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
znap pull
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mv init.vim ~/.config/nvim/
mv alacritty.yml ~/.config/alacritty/alacritty.yml
mv rc.lua ~/.config/awesome
mv rofi.rasi ~/.config/awesome/home/configuration
cd 
echo "RANGER_LOAD_DEFAULT_RC=false"
