sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay --devel --save
sudo pacman -Syu
cd -
sudo pacman -S   <awmlpkgs.txt -y
yay -S <ywml.txt
./gwml.sh
chsh -s $(which zsh)
echo "RANGER_LOAD_DEFAULT_RC=false"
