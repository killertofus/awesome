# please don't run this more then twice :)
pkgToRemoveListFull="nano *printer-driver* *thunderbird* *libreoffice* *cosmic-* **libreoffice-* man-db manpages *language-pack* *hunspell* cups-common xterm""
pkgToRemoveList=""
for pkgToRemove in $(echo $pkgToRemoveListFull); do
  $(apt --status $pkgToRemove &> /dev/null)
  if [[ $? -eq 0 ]]; then
    pkgToRemoveList="$pkgToRemoveList $pkgToRemove"
  fi
done
sudo apt purge $pkgToRemoveList
