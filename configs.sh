#!/usr/bin/env sh
mv .themes ~/.local/share
cp -r .config ~/
mv .zshrc ~/
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
~/.config/tmux/plugins/tpm/scripts/install_plugins.sh
wget https://github.com/dracula/zsh/archive/master.zip
unzip master.zip
mv zsh-master/lib zsh-master/dracula.zsh-theme ~/.config/oh-my-zsh/themes
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.config/oh-my-zsh/custom}/plugins/zsh-autosuggestions
osascript -e 'tell application "Finder" to set desktop picture to POSIX file "~/Pictures/wallpaper.jpg"'
# Disable personalized advertisements and identifier tracking
echo '--- Disable personalized advertisements and identifier tracking'
defaults write com.apple.AdLib allowIdentifierForAdvertising -bool false
defaults write com.apple.AdLib allowApplePersonalizedAdvertising -bool false
defaults write com.apple.AdLib forceLimitAdTracking -bool true
# ----------------------------------------------------------


# ----------------------------------------------------------
# ---------Disable guest sign-in from login screen----------
# ----------------------------------------------------------
echo '--- Disable guest sign-in from login screen'
sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool NO
# ----------------------------------------------------------


# ----------------------------------------------------------
# -------Disable guest access to file shares over AF--------
# ----------------------------------------------------------
echo '--- Disable guest access to file shares over AF'
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server AllowGuestAccess -bool NO
# ----------------------------------------------------------


# ----------------------------------------------------------
# -------Disable guest access to file shares over SMB-------
# ----------------------------------------------------------
echo '--- Disable guest access to file shares over SMB'
sudo defaults write /Library/Preferences/com.apple.AppleFileServer guestAccess -bool NO
# ----------------------------------------------------------


# ----------------------------------------------------------
# -------Disable incoming SSH and SFTP remote logins--------
# ----------------------------------------------------------
echo '--- Disable incoming SSH and SFTP remote logins'
echo 'yes' | sudo systemsetup -setremotelogin off
# ----------------------------------------------------------


# ----------------------------------------------------------
# ------------Disable the insecure TFTP service-------------
# ----------------------------------------------------------
echo '--- Disable the insecure TFTP service'
sudo launchctl disable 'system/com.apple.tftpd'
# ----------------------------------------------------------


# ----------------------------------------------------------
# ----------Disable Bonjour multicast advertising-----------
# ----------------------------------------------------------
echo '--- Disable Bonjour multicast advertising'
sudo defaults write /Library/Preferences/com.apple.mDNSResponder.plist NoMulticastAdvertisements -bool true
# ----------------------------------------------------------


# ----------------------------------------------------------
# -------------Disable insecure telnet protocol-------------
# ----------------------------------------------------------
echo '--- Disable insecure telnet protocol'
sudo launchctl disable system/com.apple.telnetd
# ----------------------------------------------------------
