sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si -y
yay -S $(cat ywmlpkgs.txt | cut -d' ' -f1) -y
sudo pacman -S $(cat yourfilename | cut -d' ' -f1) -y
yay --devel --save
sudo pacman -Syu
cd -
./gwml.sh
chsh -s $(which zsh)
echo "RANGER_LOAD_DEFAULT_RC=false"
