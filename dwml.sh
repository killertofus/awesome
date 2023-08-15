#!/usr/bin/env bash
xargs sudo apt install <dwmlpkgs.txt
xargs sudo apt purge -m <dwmlrmvpkgs.txt
 #remove below when alacritty and lsd are in the mint repos
 sudo add-apt-repository ppa:aslatter/ppa -y
 sudo apt update
 sudo apt install alacritty
curl -sS https://webi.sh/lsd | sh
source ~/config/envman/PATH.env
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
sudo apt update
sudo apt install github-desktop
echo "RANGER_LOAD_DEFAULT_RC=false"
sudo systemctl enable lightdm
sudo apt update -y && sudo apt upgrade -y && sudo apt clean -y && sudo apt autoclean -y && sudo apt autoremove -y

 git clone --recurse-submodules https://github.com/fairyglade/ly
cd ly
make
make run
make install installsystemd
sudo systemctl enable ly.service
systemctl disable getty@tty2.service
cd -
./gwml.sh
cd config/debian
mv .zshrc ~/.
cd ..
./Jdownloader2.sh
