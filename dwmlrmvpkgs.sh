pkgToRemoveListFull="dictionaries-comon emacsen-common $DESKTOP_SESSION gnome-games hypnotix hexchat libreoffice-base-core p7zip-full rhythmbox-tray-icon rhythmbox-data rhythmbox-plugins snapd snap rhythmbox vim-common vim-tiny warpinator youtube-dl yelp"
pkgToRemoveList=""
for pkgToRemove in $(echo $pkgToRemoveListFull); do
  $(dpkg --status $pkgToRemove &> /dev/null)
  if [[ $? -eq 0 ]]; then
    pkgToRemoveList="$pkgToRemoveList $pkgToRemove"
  fi
done
apt-get --yes --purge remove $pkgToRemoveList
