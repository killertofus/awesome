#!/usr/bin/env bash
sudo rm -rf */usr/share/xsessions
sudo wget -p /usr/share/fonts/Iosevka
sudo wget  https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Iosevka.tar.xz --directory-prefix=/usr/share/fonts/Iosevka/
sudo tar -xvf /usr/share/fonts/Iosevka/Iosevka.tar.xz -C /usr/share/fonts/Iosevka/
sudo rm -rf /usr/share/fonts/Iosevka/Iosevka.tar.xz /usr/share/fonts/Iosevka/*.md
sudo apt update
xargs sudo apt install < packages.txt -y
(crontab -l ; echo "0 0 */3 * * /usr/local/bin/update.sh") | crontab
fc-cache -fv
sudo mv update.sh /usr/local/bin
chsh -s $(which zsh)
sudo mv rustdesk.desktop /usr/share/applications
sudo mv *.png /usr/share/icons
sudo mkdir -p /usr/local/bin
curl -s https://api.github.com/repos/rustdesk/rustdesk/releases/latest \
| grep "x86_64.*AppImage" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -
 
 mv *.AppImage rustdesk
 find ./  -regextype posix-egrep -regex '.*{3,5}.*' -print0 | xargs -0 chmod +x
sudo mv rustdesk /usr/local/bin

nvim > /dev/null 2>&1 &
./configs && sudo apt update && sudo apt upgrade -y && sudo apt clean && sudo apt autoclean && sudo apt autoremove -y
sudo apt purge plasma-discover kdeconnect -y
rm -rf $(pwd)
