# please don't run this more then twice :)
pkgToRemoveListFull=""
pkgToRemoveList="nano *printer-driver* *thunderbird* *libreoffice* *cosmic-* *gnome* gnome-orca *libreoffice-* man-db manpages *lamguage-pack* *hunspell* cups-common xterm"
for pkgToRemove in $(echo $pkgToRemoveListFull); do
  $(dpkg --status $pkgToRemove &> /dev/null)
  if [[ $? -eq 0 ]]; then
    pkgToRemoveList="$pkgToRemoveList $pkgToRemove"
  fi
done
sudo dpkg --remove --force-all $pkgToRemoveList
