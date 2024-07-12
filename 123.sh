PS3='dwl or dwm: '
options=("dwl" "dwm")
select opt in "${options[@]}"
do
    case $opt in
        "dwl")
            sudo apt install wayland-protocols libwayland-cursor++1 libwayland-bin libinput-devlib wayland-dev libwlroots-dev
            break
            ;;
        "dwm")
            echo "you chose choice 2"
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
