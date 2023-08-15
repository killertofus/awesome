#!/usr/bin/env bash
#sudo apt purge "$DESKTOP_SESSION" -y
xargs sudo apt install <dwmlpkgs.txt
xargs sudo dpkg purge <dwmlrmvpkgs.txt
 #remove below when alacritty and lsd are in the mint repos
 sudo add-apt-repository ppa:aslatter/ppa
 apt update
 apt install alacritty
curl -sS https://webi.sh/lsd | sh
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
y
apt update

apt install librewolf -y


cd /usr/local/bin

curl -s https://api.github.com/repos/Chatterino/chatterino2/releases/latest \
| grep ".*-x86_64.AppImage" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -

curl -s https://api.github.com/repos/streamlink/streamlink-twitch-gui/releases/latest \
| grep "x86_64.*AppImage" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -
find ./  -regextype posix-egrep -regex '.*{3,5}.*' -print0 | xargs -0 chmod +x

cd -
wget -qO - https://apt.packages.shiftkey.dev/gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/shiftkey-packages.gpg > /dev/null
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/shiftkey-packages.gpg] https://apt.packages.shiftkey.dev/ubuntu/ any main" > /etc/apt/sources.list.d/shiftkey-packages.list'
apt update
apt install github-desktop

./Jdownloader2.sh
mkdir -p ~/.config/nvim
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/awesome
mkdir -p ~/.config/rofi
mkdir -p ~/.config/picom

cd config/debian
mv .zshrc ~/.
cd ..//..
mv init.vim ~/.config/nvim/
mv alacritty.yml ~/.config/alacritty/
mv rc.lua theme ~/.config/awesome
mv rofi.rasi ~/.config/rofi
mv picom.conf ~/.config/picom
cd ..
echo "RANGER_LOAD_DEFAULT_RC=false"
sudo systemctl enable lightdm
update
./gwml.sh
