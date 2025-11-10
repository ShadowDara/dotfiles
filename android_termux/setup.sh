# Android Termux Install Script
# by Shadowdara 2025

# version Control system
pkg install git

# htop task manager
pkg install htop

# neovim text editor
pkg install neovim

# pip
pkg install python-pip

# to Print system Information
pkg install fastfetch

# Download Flutter
git clone https://github.com/flutter/flutter.git
# Start Flutter for the First Time to download missing stuff and test it
~/flutter/bin/flutter
~/flutter/bin/flutter doctor

# Update existing packages
pkg upgrade

echo Finished!
