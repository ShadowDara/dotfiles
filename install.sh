#!/usr/bin/env bash
set -e

# ***********************************
# Dotfiles Installations-Skript
# 
# ONLY USED FOR CODESPACES!!!
#
# by Shadowdara
# ***********************************

# Dotfiles-Verzeichnis
DOTFILES_DIR=$HOME/dotfiles

# Symbolic Links erstellen
#ln -sf $DOTFILES_DIR/.zshrc $HOME/.zshrc
ln -sf $DOTFILES_DIR/configs/.gitconfig $HOME/.gitconfig
#ln -sf $DOTFILES_DIR/.vimrc $HOME/.vimrc

# htop for Ubuntu
sudo apt install htop

# Jekyll
bundle install

# Rust installieren (offizieller Installer)
if ! command -v rustc &> /dev/null; then
  echo "🔧 Installing Rust..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  source $HOME/.cargo/env
else
  echo "✅ Rust already installed."
fi

# Powershell install
# Update & install dependencies
# sudo apt update
# sudo apt install -y wget apt-transport-https software-properties-common

# # Microsoft GPG key hinzufügen
# wget -q https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb
# sudo dpkg -i packages-microsoft-prod.deb

# # PowerShell installieren
# sudo apt update
# sudo apt install -y powershell

# Download Download Files
# node scripts/download.js


echo "Dotfiles installiert"
