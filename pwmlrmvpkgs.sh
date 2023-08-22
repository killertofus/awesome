pkgToRemoveListFull=" *$DESKTOP_SESSION* gnome-games gnome-terminal orca xterm libreoffice-base-core snapd snap vim-common vim-tiny yelp *gnome*"
pkgToRemoveList=""
for pkgToRemove in $(echo $pkgToRemoveListFull); do
  $(dpkg --status $pkgToRemove &> /dev/null)
  if [[ $? -eq 0 ]]; then
    pkgToRemoveList="$pkgToRemoveList $pkgToRemove"
  fi
done
apt --yes --purge remove $pkgToRemoveList
