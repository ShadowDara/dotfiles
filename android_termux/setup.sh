# Android Termux Install Script
# by Shadowdara 2025

# Create .bashrc
cat >> .bashrc << EOF
# .bashrc File for Termux Android
# by Shadowdara 2025

# Add Flutter to the path
export PATH=$PATH:$HOME/flutter/bin

# Start Fastfetch to print system Infos
fastfetch --logo none
EOF

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

# INFO
# Flutter does not work because the mobile ARM Processor Architekture.
#
# Download Flutter
#git clone https://github.com/flutter/flutter.git
# Start Flutter for the First Time to download missing stuff and test it
#~/flutter/bin/flutter
#~/flutter/bin/flutter doctor

# Install the Science Community Repo for Termux to get more packages
pkg install x11-repo
pkg install science-repo

# Update existing packages
pkg upgrade

# Reload the File
source ~/.bashrc

# Finish
echo Finished!
