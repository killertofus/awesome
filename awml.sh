cd /usr/share/xsessions
sudo pacman -S tmux

tmux new "sudo pacman -S $(cat awmlpkgs.txt | cut -d' ' -f2) ; sleep 100" ';' split "yay -S $(cat ywmlpkgs.txt | cut -d' ' -f1) ; sleep 100"
sudo rm -rf *
cd -
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay --devel --save
sudo pacman -Syu
cd -
./gwml.sh
chsh -s $(which zsh)
echo "RANGER_LOAD_DEFAULT_RC=false"
