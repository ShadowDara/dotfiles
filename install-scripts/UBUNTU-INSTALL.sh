# Bash Script for Ubuntu 20.04

echo "Installing"

sudo apt update
sudo apt install git
sudo apt install node
sudo apt install npm
sudo apt install build-essential
sudo apt install pkg-config libssl-dev

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Github Desktop
# https://gist.github.com/4lxprime/8c946f1041e9a3d25a9531d427b75efe
sudo wget https://github.com/shiftkey/desktop/releases/download/release-3.2.0-linux1/GitHubDesktop-linux-3.2.0-linux1.deb
sudo dpkg -i GitHubDesktop-linux-3.2.0-linux1.deb

echo "Finished Installing"
