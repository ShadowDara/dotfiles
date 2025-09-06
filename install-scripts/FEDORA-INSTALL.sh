# Bash Script for Linux Fedora
# to install useful stuff for programming

# written by Shadowdara MIT 2025

echo "Installing:"
echo "- Python"
echo "- Neovim"
echo "- Go"
echo "- NodeJS"
echo "- HTOP"
echo "- Podman Docker"
echo "- NixOS"
echo "- Xournalpp"
echo "- 7zip"
echo "- GIMP"
echo "- Rust"
echo "- Flatpak"
echo "- IntelliJ IDEA"
echo "- PyCharm"
echo "- Webstorm"
echo "- OpenSSL"

read

# Python
echo "Installing Python"
sudo dnf install python3
sudo dnf install python3-pip
sudo dnf install python3-tkinter

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
echo "Installing NisOS"#0
sh <(curl -L https://nixos.org/nix/install) --daemon

# Xournalpp
echo "Installing Xournalpp"
sudo dnf install xournalpp

# 7zip
echo "Installing 7zip"
sudo dnf install p7zip p7zip-plugins

# GIMP
echo "Installing GIMP"
sudo dnf install gimp

# Rust
echo "Installing Rust"
sudo dnf install rust cargo

# Flatpak
echo "Installing Flatpak"
sudo dnf install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# PyCharm
echo "Installing PyCharm"
flatpak install flathub com.jetbrains.PyCharm-Community

# Intellij Idea
echo "Installing IntelliJ IDEA"
flatpak install flathub com.jetbrains.IntelliJ-IDEA-Community

# WebStorm
echo "Installing Webstorm"
flatpak install flathub com.jetbrains.WebStorm

# OpenSSL
echo "Installing OpenSSL"
sudo dnf install openssl-devel pkgconfig
