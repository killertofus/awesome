rustdesk=$(curl -s https://api.github.com/repos/rustdesk/rustdesk/releases | \
jq -r 'first(.[].tag_name | select(test("^[0-9]")))' )


if ! [ -e "rustdesk.txt" ] ; then
    touch "rustdesk.txt"
fi


if [ "$rustdesk" != "$(cat rustdesk.txt)" ]; then curl -s https://api.github.com/repos/rustdesk/rustdesk/releases/latest \
| grep "x86_64.*AppImage" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -; 
echo "$rustdesk" > rustdesk.txt
mv  -- *x86_64.AppImage rustdesk.AppImage
fi
sudo mv  rustdesk /usr/local/bin
