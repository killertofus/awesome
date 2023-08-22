pkgToRemoveListFull=" emacsen-common dictionaries-common transmission-common $DESKTOP_SESSION  slick-greeter celluloid gnome-games gnome-terminal hypnotix nemo hexchat orca xterm nano transmission libreoffice-base-core p7zip-full rhythmbox-tray-icon rhythmbox-data rhythmbox-plugins snapd snap rhythmbox vim-common vim-tiny xterm warpinator youtube-dl yelp *gnome*"
pkgToRemoveList=""
for pkgToRemove in $(echo $pkgToRemoveListFull); do
  $(dpkg --status $pkgToRemove &> /dev/null)
  if [[ $? -eq 0 ]]; then
    pkgToRemoveList="$pkgToRemoveList $pkgToRemove"
  fi
done
apt --yes --purge remove $pkgToRemoveList
