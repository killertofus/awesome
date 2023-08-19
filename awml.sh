cd /usr/share/xsessions
sudo pacman -S tmux

tmux new "awk '{print $1}'  awmlpkgs.txt |  xargs sudo pacman -S ; sleep 100" ';' split "awk '{print $1}'  ywmlpkgs.txt |  xargs yay -S ; sleep 100"
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
