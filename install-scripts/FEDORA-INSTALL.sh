# Bash Script for Linux Fedora
# to install useful stuff for programming

# written by Shadowdara MIT 2025

echo "Installing:"
echo "- Neovim"
echo "- Go"
echo "- NodeJS"
echo "- HTOP"
echo "- Podman Docker"
echo "- NixOS"
echo "- Xournalpp"
echo "- 7zip"

# Neovim
echo "Installing Neovim with Python3 Extension"
sudo dnf install neovim
sudo dnf install python3-neovim

# GO
echo "Installing Golang"
sudo dnf install golang

# NodeJS
echo "Installing NodeJS"
dnf module list nodejs
sudo dnf module enable nodejs:20
sudo dnf install nodejs
# yarn package manager
sudo npm install -g yarn

# HTOP System Monitor
echo "Installing HTOP"
sudo dnf install htop

# Podman Docker
echo "Installing Podman Docker"
#sudo dnf install podman

# NixOS
echo "Installing NisOS"#
sh <(curl -L https://nixos.org/nix/install) --daemon

# Xournalpp
echo "Installing Xournalpp"
sudo dnf install xournalpp

# 7zip
echo "Installing 7zip"
sudo dnf install p7zip p7zip-plugins

