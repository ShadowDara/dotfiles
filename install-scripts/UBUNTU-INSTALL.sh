#!/bin/bash

echo "Updating package lists..."
sudo apt update

echo "Installing packages..."
sudo apt install -y git nodejs npm build-essential pkg-config libssl-dev python3-pip wget neovim

# Rust installation check
if ! command -v rustc >/dev/null 2>&1; then
    echo "Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
else
    echo "Rust is already installed, skipping."
fi

# GitHub Desktop installation
GITHUB_DESKTOP_DEB="GitHubDesktop-linux-3.2.0-linux1.deb"
if ! command -v github-desktop >/dev/null 2>&1; then
    echo "Downloading GitHub Desktop..."
    wget -q https://github.com/shiftkey/desktop/releases/download/release-3.2.0-linux1/$GITHUB_DESKTOP_DEB
    echo "Installing GitHub Desktop..."
    sudo dpkg -i $GITHUB_DESKTOP_DEB || sudo apt-get install -f -y
    rm $GITHUB_DESKTOP_DEB
else
    echo "GitHub Desktop is already installed, skipping."
fi

echo -e "\nFinished Installing!\n"

echo "Add the following lines to your ~/.bashrc if not already added:"
echo '. "$HOME/.cargo/env"'
echo 'export PATH="$PATH:$HOME/.local/bin"'

echo "You can run 'source ~/.bashrc' or restart your terminal to apply changes."
