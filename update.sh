streamlink_twitch_gui=$(curl -s https://api.github.com/repos/streamlink/streamlink-twitch-gui/releases | \
jq -r 'first(.[].tag_name | select(test("^v[0-9]")))' )


if ! [ -e "streamlink_twitch_gui.txt" ] ; then
    touch "streamlink_twitch_gui.txt"
fi
if [ "$streamlink_twitch_gui" != "$(cat streamlink_twitch_gui.txt)" ]; then curl -s https://api.github.com/repos/streamlink/streamlink-twitch-gui/releases/latest \
| grep "x86_64.*AppImage" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -; 
echo "$streamlink_twitch_gui" > streamlink_twitch_gui.txt
mv -- *.AppImage streamlink_twitch_gui.AppImage
fi
