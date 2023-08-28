pkgToRemoveListFull=" yelp vim-common vim-tiny baobab gnome-online-miners gnome-bluetooth-common gnome-calculator gnome-settings-daemon-common gnome-menus geary orca gnome-desktop3-data gedit-common language-selector-gnome gnome-shell-common printer-driver-all toilet pop-server libreoffice-common libreoffice-base-core $DESKTOP_SESSION 'language-pack*' nano gedit pop-desktop pop-shell pop-cosmic gnome-terminal hunspell hyphen grim zenity "
pkgToRemoveList=""
for pkgToRemove in $(echo $pkgToRemoveListFull); do
  $(dpkg --status $pkgToRemove &> /dev/null)
  if [[ $? -eq 0 ]]; then
    pkgToRemoveList="$pkgToRemoveList $pkgToRemove"
  fi
done
sudo apt --yes --purge remove --allow-remove-essential $pkgToRemoveList
