sudo apt update && sudo apt upgrade && sudo apt clean && sudo apt autoclean && sudo apt autoremove
sudo apt-get install lightdm x11vnc nvim git zsh -y


wget https://installers.privateinternetaccess.com/download/pia-linux-arm64-3.3.1-06924.run
sh ./pia-linux-arm64-3.3.1-06924.run
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo 'deb http://download.opensuse.org/repositories/shells:/zsh-users:/zsh-autosuggestions/xUbuntu_22.04/ /' | sudo tee /etc/apt/sources.list.d/shells:zsh-users:zsh-autosuggestions.list
curl -fsSL https://download.opensuse.org/repositories/shells:zsh-users:zsh-autosuggestions/xUbuntu_22.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_zsh-users_zsh-autosuggestions.gpg > /dev/null
cd .oh-my-zsh/themes/
git clone https://github.com/dracula/zsh.git
cd zsh 
mv dracula.zsh-theme lib ..
sudo apt update
sudo apt install zsh-autosuggestions -y
sudo apt remove libreoffice gnome-games nano snap -y 
sudo snap remove firefox
sudo add-apt-repository ppa:mozillateam/ppa -y
sudo apt remove --autoremove firefox -y
echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox
sudo apt install firefox -y
nvim /etc/apt/preferences.d/99mozillateamppa
sudo rm -rf /var/cache/snapd/
sudo apt install -t 'o=LP-PPA-mozillateam' firefox -y
sudo apt autoremove --purge snapd gnome-software-plugin-snap -y
rm -rf ~/snap
nvim /lib/systemd/system/x11vnc.service
systemctl daemon-reload
systemctl enable x11vnc.service
systemctl start x11vnc.service
systemctl status x11vnc.service
sudo apt update && sudo apt upgrade && sudo apt clean && sudo apt autoclean && sudo apt autoremove
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
