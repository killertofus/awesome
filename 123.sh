#!/bin/bash
echo " dwl or dwm"
echo "  1)dwl"
echo "  2)dwm"

read n
case $n in
  1) echo "sudo apt install wayland-protocols libwayland-cursor++1 libwayland-bin libinput-devlib wayland-dev libwlroots-dev ";;
  2) echo "dwm";;
  *) echo "invalid option";;
esac
