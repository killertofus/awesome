PS3='dwl or dwm: '
options=("dwl" "dwm")
select opt in "${options[@]}"
do
    case $opt in
        "dwl")
            #sed  's/dwm/dwl/g' gwml.sh
            #sed  '21d;20d' gwml.sh
            #sed  's/picom/wdisplays/g' dwmlpkgs.txt
            #sed  's/feh/wayland-protocols/g' dwmlpkgs.txt
            sed   '1 a libwayland-cursor++1 libwayland-bin libinput-dev libwayland-dev libwlroots-dev' dwmlpkgs.txt
            #sed  's/volumeicon-alsa/waybar/g' dwmlpkgs.txt
            #sed  '$ git clone https://github.com/LGFae/swww/' dwml.sh
            #sed -i '70 a git clone https://github.com/LGFae/swww/' dwml.sh
            #sed -i '73 a cd sww && cargo build --release' dwml.sh 
            cat dwmlpkgs.txt
            break
            ;;
        "dwm")
            echo "you chose choice 2"
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
