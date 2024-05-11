#!/usr/bin/env sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
mkdir -p ~/.themes
git clone https://github.com/dracula/gtk
mv gtk/gtk-4.0 ~/.themes
mkdir -p ~/.config/nvim
mkdir -p ~/.config/alacritty
mv config/.xinitrc ~/
mv config/init.vim ~/.config/nvim/
mv config/alacritty.toml ~/.config/alacritty
mv config/.zshrc ~/
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
wget https://github.com/dracula/zsh/archive/master.zip
unzip master.zip
mv zsh-master/lib zsh-master/dracula.zsh-theme ~/.oh-my-zsh/themes
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
