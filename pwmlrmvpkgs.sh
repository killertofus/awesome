# please don't run this more then twice :)
pkgToRemoveListFull="  yelp vim-common vim-tiny baobab gnome-online-miners gnome-bluetooth-common pop-desktop pop-shell gnome-calculator gnome-settings-daemon-common geary orca gedit-common language-selector-gnome gnome-shell-common  toilet libreoffice-common libreoffice-base-core $DESKTOP_SESSION 'language-pack*' nano gedit gnome-terminal hunspell hyphen grim zenity  "
pkgToRemoveList=""
for pkgToRemove in $(echo $pkgToRemoveListFull); do
  $(dpkg --status $pkgToRemove &> /dev/null)
  if [[ $? -eq 0 ]]; then
    pkgToRemoveList="$pkgToRemoveList $pkgToRemove"
  fi
done
apt --yes --purge remove --allow-remove-essential $pkgToRemoveList
