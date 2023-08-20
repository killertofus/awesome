pkgToRemoveListFull=" yt-dlp vim-common libreoffice-base-core *$DESKTOP_SESSION*"
pkgToRemoveList=""
for pkgToRemove in $(echo $pkgToRemoveListFull); do
  $(dpkg --status $pkgToRemove &> /dev/null)
  if [[ $? -eq 0 ]]; then
    pkgToRemoveList="$pkgToRemoveList $pkgToRemove"
  fi
done
apt --yes --purge remove $pkgToRemoveList
