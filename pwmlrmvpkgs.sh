pkgToRemoveListFull="  yelp vim-common vim-tiny  libreoffice-common libreoffice-base-core $DESKTOP_SESSION  'language-pack*' nano 'pop*' 'gnome*' "
pkgToRemoveList=""
for pkgToRemove in $(echo $pkgToRemoveListFull); do
  $(dpkg --status $pkgToRemove &> /dev/null)
  if [[ $? -eq 0 ]]; then
    pkgToRemoveList="$pkgToRemoveList $pkgToRemove"
  fi
done
sudo apt --yes --purge remove --allow-remove-essential $pkgToRemoveList
