#!/usr/bin/env bash
sudo rm -rf */usr/share/xsessions
sudo wget -p /usr/share/fonts/Iosevka
sudo wget  https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Iosevka.tar.xz --directory-prefix=/usr/share/fonts/Iosevka/
sudo tar -xvf /usr/share/fonts/Iosevka/Iosevka.tar.xz -C /usr/share/fonts/Iosevka/
sudo rm -rf /usr/share/fonts/Iosevka/Iosevka.tar.xz /usr/share/fonts/Iosevka/*.md
xargs sudo apt install <dwmlpkgs.txt -y
chsh -s $(which zsh)
fc-cache -f -v
sudo systemctl enable libvirtd
sudo adduser $USER libvirt
sudo adduser $USER kvm
sudo dpkg --add-architecture i386
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
main() {
   codename=$(grep -m1 "CODENAME" /etc/os-release | cut -d'=' -f2)
    printf "%b" '\033[1;33mDownloading..\n\033[0m'
    sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/$codename/winehq-$codename.sources
    printf "%b" '\033[1;32mDone! Goodbye!\n\033[0m'
}

main
sudo apt update && sudo apt upgrade -y
sudo apt install winehq-staging -y 
rm -rf ~/snap
flatpak install -y --noninteractive flathub com.chatterino.chatterino/x86_64/stable librewolf io.github.shiftey.Desktop org.jellyfin.JellyfinServer JDownloader
sudo mv streamlink.desktop /usr/share/applications
sudo mv rustdesk.desktop /usr/share/applications
sudo mv *.png /usr/share/icons
sudo mkdir -p /usr/local/bin


mkdir zig
cd zig
wget https://ziglang.org/download/0.13.0/zig-linux-x86_64-0.13.0.tar.xz
 tar xf *
 rm -rf *.tar.xz
 mv * zig
 sudo mv zig/lib zig/zig /usr/local/bin
 cd -



curl -s https://api.github.com/repos/streamlink/streamlink-twitch-gui/releases/latest \
| grep "x86_64.*AppImage" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -

 mv *.AppImage Streamlink_Twitch_GUI


curl -s https://api.github.com/repos/rustdesk/rustdesk/releases/latest \
| grep "x86_64.*AppImage" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -
 
 mv *.AppImage rustdesk
 find ./  -regextype posix-egrep -regex '.*{3,5}.*' -print0 | xargs -0 chmod +x
sudo mv  rustdesk  Streamlink_Twitch_GUI /usr/local/bin


sudo apt update && sudo apt upgrade && sudo apt clean && sudo apt autoclean && sudo apt autoremove -y
./gwml.sh
sudo systemctl disable display-manager.service
nvim > /dev/null 2>&1 &
git clone --recurse-submodules https://github.com/fairyglade/ly
cd ly
zig build
sudo zig build installsystemd
sudo systemctl disable getty@tty2.service
cd -
./pwmlrmvpkgs.sh && sudo apt update && sudo apt upgrade && sudo apt clean && sudo apt autoclean && sudo apt autoremove -y
sudo systemctl enable ly.service
