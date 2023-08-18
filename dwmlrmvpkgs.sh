pkgToRemoveListFull=" emacsen-common dictionaries-common $DESKTOP_SESSION  nemo gnome-games yaru gnome-terminal orca xterm transmission hypnotix hexchat yelp-xsl libreoffice-base p7zip-full rhythmbox-tray-icon rhythmbox-data rhythmbox-plugins snapd snap rhythmbox vim-common vim-tiny warpinator youtube-dl yelp gnome"
pkgToRemoveList=""
for pkgToRemove in $(echo $pkgToRemoveListFull); do
  $(dpkg --status $pkgToRemove &> /dev/null)
  if [[ $? -eq 0 ]]; then
    pkgToRemoveList="$pkgToRemoveList $pkgToRemove"
  fi
done
apt --yes --purge remove $pkgToRemoveList
