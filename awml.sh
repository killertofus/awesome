sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd -
for word in $(cat ywmlpkgs.txt); do yay -S --noconfirm --mflags --skipinteg $word || true; done
sudo pacman -S $(cat awmlpkgs.txt | cut -d' ' -f1)
sudo systemctl enable ly
yay --devel --save
sudo pacman -Syu
sudo pacman -Qttdq | sudo pacman -Rns -
yay -Scc 
sudo systemctl enable --now piavpn.service
sudo reflector --latest 200 --sort rate --save /etc/pacman.d/mirrorlist
chsh -s $(which zsh)
fc-cache -f -v
./gwml.sh
