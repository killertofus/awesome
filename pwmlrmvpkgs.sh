pkgToRemoveListFull=" yelp vim-common vim-tiny printer-driver-all toilet pop-server libreoffice-common libreoffice-base-core $DESKTOP_SESSION 'language-pack*' nano gedit pop-desktop pop-shell pop-cosmic gnome-terminal hunspell hyphen grim zenity "
pkgToRemoveList=""
for pkgToRemove in $(echo $pkgToRemoveListFull); do
  $(dpkg --status $pkgToRemove &> /dev/null)
  if [[ $? -eq 0 ]]; then
    pkgToRemoveList="$pkgToRemoveList $pkgToRemove"
  fi
done
sudo apt --yes --purge remove --allow-remove-essential $pkgToRemoveList
