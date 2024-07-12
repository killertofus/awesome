PS3='dwl or dwm: '
options=("dwl" "dwm")
select opt in "${options[@]}"
do
    case $opt in
        "dwl")
            sudo apt install wayland-protocols libwayland-cursor++1 libwayland-bin libinput-dev libwayland-dev libwlroots-dev
            sed -i 's/dwm/dwl/g' gwml.sh
            sed -i '21d;20d' gwml.sh
            cat gwml.sh
            break
            ;;
        "dwm")
            echo "you chose choice 2"
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
