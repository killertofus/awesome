#!/usr/bin/env bash
a = pkgToRemoveListFull=" emacsen-common dictionaries-common gedit celluoid *$DESKTOP_SESSION* gnome-games gnome-terminal hypnotix hexchat orca xterm transmission libreoffice-base-core p7zip-full rhythmbox-tray-icon rhythmbox-data rhythmbox-plugins snapd snap rhythmbox vim-common vim-tiny warpinator youtube-dl yelp *gnome*"
pkgToRemoveList=""
for pkgToRemove in $(echo $pkgToRemoveListFull); do
  $(dpkg --status $pkgToRemove &> /dev/null)
  if [[ $? -eq 0 ]]; then
    pkgToRemoveList="$pkgToRemoveList $pkgToRemove"
  fi
done
apt --yes --purge remove $pkgToRemoveList

if [  -n "$(uname -a | grep mint)" ]; then
  a
  done
