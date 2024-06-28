# please don't run this more then twice :)
pkgToRemoveListFull="  yelp vim-common vim-tiny baobab gnome-online-miners gnome-bluetooth-common gnome-calculator gnome-terminal gnome-settings-daemon-common geary orca gedit-common language-selector-gnome toilet libreoffice-common libreoffice-base-core $DESKTOP_SESSION 'language-pack*' nano gedit gnome-terminal hunspell hyphen grim zenity gnome-control-center libreoffice-core  pop-de-gnome libreoffice-gnome pop-desktop *libreoffice* *gnome* gnome-orca *libreoffice-* mate-user-guide *nautilus-* ubuntu-docs "
pkgToRemoveList=""
for pkgToRemove in $(echo $pkgToRemoveListFull); do
  $(dpkg --status $pkgToRemove &> /dev/null)
  if [[ $? -eq 0 ]]; then
    pkgToRemoveList="$pkgToRemoveList $pkgToRemove"
  fi
done
sudo dpkg --remove --force-all $pkgToRemoveList
