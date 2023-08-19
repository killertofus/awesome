yay -S <ywml.txt -y
sudo pacman -S <awmlpkgs.txt -y
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
