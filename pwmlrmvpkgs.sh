# please don't run this more then twice :)
pkgToRemoveListFull=""
pkgToRemoveList="fwupd nano popsicle *pop-* *printer-driver* *thunderbird* *cosmic-* *libreoffice-* man-db manpages *gnome* *language-pack* *hunspell* cups-common xterm"
for pkgToRemove in $(echo $pkgToRemoveListFull); do
  $(apt --status $pkgToRemove &> /dev/null)
  if [[ $? -eq 0 ]]; then
    pkgToRemoveList="$pkgToRemoveList $pkgToRemove"
  fi
done
sudo apt purge $pkgToRemoveList --allow-remove-essential -y && sudo apt install policykit-1-gnome gnome-disk-utility -y && sudo apt update && sudo apt upgrade && sudo apt clean && sudo apt autoclean && sudo apt autoremove -y
