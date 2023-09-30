#!/bin/sh
feh --bg-fill ~/Pictures/wall/wall.png &
picom -b & 
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
dunst
xscreensaver -nosplash
volumeicon
/opt/piavin/bin/pia-client %u
dwm
