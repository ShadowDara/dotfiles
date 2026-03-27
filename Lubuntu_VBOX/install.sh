# Installation Stuff for the Lubuntu VBOX

# Neovim, CMake, LibGTK
sudo apt install neovim neofetch cmake libgtk-4-dev g++

# Flutter
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install -y clang cmake ninja-build pkg-config libgtk-3-dev libstdc++-12-dev

# VS Code
sudo apt install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.visualstudio.code

# Rust
# Bun

# Tauri
sudo apt update
sudo apt install libwebkit2gtk-4.1-dev libgtk-3-dev build-essential curl wget file libssl-dev libayatana-appindicator3-dev librsvg2-dev

# Go
sudo apt install golang-go
# Install Finder
go install github.com/shadowdara/finder/cmd/finder@latest

# Folder Analyser
sudo apt update
sudo apt install baobab

# Network Stats
sudo apt update
sudo apt install vnstat
