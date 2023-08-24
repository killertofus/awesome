#!/usr/bin/env bash
cd /usr/share/xsessions
sudo rm -rf *
cd -
xargs sudo apt install <dwmlpkgs.txt
 #remove below when lsd is in the popos repo
 git clone https://github.com/ryanoasis/nerd-fonts
cd nerd-fonts
./install.sh Iosevka
cd -
 sudo dpkg --add-architecture i386
 sudo mkdir -pm755 /etc/apt/keyrings
 sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/${linux_release_name}winehq-${linux_release_name}.sources 
 sudo apt update
 sudo apt install winehq-staging -y
 sudo apt install alacritty -y
 curl -sSL https://raw.githubusercontent.com/alacritty/alacritty/master/extra/alacritty.info | tic -x 
curl -sS https://webi.sh/lsd | sh
source ~/config/envman/PATH.env
rm -rf ~/snap
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

curl https://repo.jellyfin.org/install-debuntu.sh | sudo bash
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://repo.jellyfin.org/jellyfin_team.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/jellyfin.gpg
cat <<EOF | sudo tee /etc/apt/sources.list.d/jellyfin.sources
Types: deb
URIs: https://repo.jellyfin.org/$( awk -F'=' '/^ID=/{ print $NF }' /etc/os-release )
Suites: $( awk -F'=' '/^VERSION_CODENAME=/{ print $NF }' /etc/os-release )
Components: main
Architectures: $( dpkg --print-architecture )
Signed-By: /etc/apt/keyrings/jellyfin.gpg
EOF
sudo apt update
sudo apt install jellyfin
sudo systemctl {action} jellyfin



sudo apt install librewolf -y
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
sudo apt update -y && sudo apt upgrade && sudo apt clean && sudo apt autoclean && sudo apt autoremove
./gwml.sh
cd config/debian
mv .zshrc ~/.
cd ..//..
./Jdownloader2.sh
./pwmlrmvpkgs.sh
git clone --recurse-submodules https://github.com/fairyglade/ly
cd ly
make
sudo make install installsystemd
sudo systemctl enable ly.service -f
sudo systemctl disable getty@tty2.service
sudo apt update -y && sudo apt upgrade -y && sudo apt clean -y && sudo apt autoclean -y && sudo apt autoremove -y
chsh -s $(which zsh)
