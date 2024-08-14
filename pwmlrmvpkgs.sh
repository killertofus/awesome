# please don't run this more then twice :)
pkgToRemoveListFull=""
pkgToRemoveList="nano *pop-* *printer-driver* *thunderbird* *cosmic-* *libreoffice-* man-db manpages  *language-pack* *hunspell* cups-common xterm"
for pkgToRemove in $(echo $pkgToRemoveListFull); do
  $(apt --status $pkgToRemove &> /dev/null)
  if [[ $? -eq 0 ]]; then
    pkgToRemoveList="$pkgToRemoveList $pkgToRemove"
  fi
done
sudo apt purge $pkgToRemoveList
