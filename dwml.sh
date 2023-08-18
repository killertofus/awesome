#!/usr/bin/env bash
xargs sudo apt install <dwmlpkgs.txt
mkdir -p .themes
 #remove below when alacritty and lsd are in the mint repos
 sudo add-apt-repository ppa:aslatter/ppa -y
 sudo apt update
 sudo apt install alacritty -y
 curl -sSL https://raw.githubusercontent.com/alacritty/alacritty/master/extra/alacritty.info | tic -x 
curl -sS https://webi.sh/lsd | sh
source ~/config/envman/PATH.env
rm -rf ~/snap
wget https://github.com/dracula/qbittorrent/raw/master/dracula.qbtheme
mv dracula.qbtheme ~/.themes
wget https://github.com/dracula/gtk/archive/master.zip
unzip master.zip
mv *zip gtk ~/.themes
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

apt install librewolf -y
sudo mv streamlink.desktop /usr/share/applications
sudo mv chatterino.desktop /usr/share/applications
sudo mv rustdesk.desktop /usr/share/applications
sudo mv *.png /usr/share/icons
sudo mkdir -p /usr/local/bin


curl -s https://api.github.com/repos/streamlink/streamlink-twitch-gui/releases/latest \
| grep "x86_64.*AppImage" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -

 mv *.AppImage Streamlink_Twitch_GUI
 




curl -s https://api.github.com/repos/Chatterino/chatterino2/releases/latest \
| grep "x86_64.*AppImage" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -
 mv *.AppImage Chatterino


curl -s https://api.github.com/repos/rustdesk/rustdesk/releases/latest \
| grep "x86_64.*AppImage" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -
 
 mv *.AppImage rustdesk
 find ./  -regextype posix-egrep -regex '.*{3,5}.*' -print0 | xargs -0 chmod +x
sudo mv rustdesk Chatterino Streamlink_Twitch_GUI /usr/local/bin


wget -qO - https://apt.packages.shiftkey.dev/gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/shiftkey-packages.gpg > /dev/null
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/shiftkey-packages.gpg] https://apt.packages.shiftkey.dev/ubuntu/ any main" > /etc/apt/sources.list.d/shiftkey-packages.list'
sudo apt update
sudo apt install github-desktop
echo "RANGER_LOAD_DEFAULT_RC=false"
sudo systemctl enable lightdm
sudo apt update -y && sudo apt upgrade -y && sudo apt clean -y && sudo apt autoclean -y && sudo apt autoremove -y
./gwml.sh
cd config/debian
mv .zshrc ~/.
cd ..//..
./Jdownloader2.sh
git clone --recurse-submodules https://github.com/fairyglade/ly
cd ly
make
sudo make install installsystemd
sudo systemctl enable ly.service -f
sudo systemctl disable getty@tty2.service
cd -
./dwmlrmvpkgs.sh
chsh -s $(which zsh)

