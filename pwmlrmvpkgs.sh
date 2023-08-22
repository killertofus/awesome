pkgToRemoveListFull="  yelp vim-common vim-tiny libreoffice-base-core $DESKTOP_SESSION  'language-pack.*$' nano pop-desktop --allow-remove-essential"
pkgToRemoveList=""
for pkgToRemove in $(echo $pkgToRemoveListFull); do
  $(dpkg --status $pkgToRemove &> /dev/null)
  if [[ $? -eq 0 ]]; then
    pkgToRemoveList="$pkgToRemoveList $pkgToRemove"
  fi
done
apt --yes --purge remove --allow-remove-essential $pkgToRemoveList
