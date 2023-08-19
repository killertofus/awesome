sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd -
yay -S $(cat ywmlpkgs.txt | cut -d' ' -f1)
sudo pacman -S $(cat awmlpkgs.txt | cut -d' ' -f1)
yay --devel --save
sudo pacman -Syu
cd -
./gwml.sh
chsh -s $(which zsh)
echo "RANGER_LOAD_DEFAULT_RC=false"
