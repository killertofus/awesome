#!usr/bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc
wget https://github.com/dracula/zsh/archive/master.zip
unzip master.zip
mv /lib dracula.zsh-theme ~/oh-my-zsh/themes/lib
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
znap pull
