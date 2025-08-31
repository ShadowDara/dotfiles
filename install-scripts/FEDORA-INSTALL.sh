# Bash Script for Linux Fedora
# to install useful stuff for programming

# Neovim
echo "Install Neovim with Python3 Extension"
sudo dnf install neovim
sudo dnf install python3-neovim

# GO
echo "Install Golang"
sudo dnf install golang

# NodeJS
echo "Install NodeJS"
dnf module list nodejs
sudo dnf module enable nodejs:20
sudo dnf install nodejs
# yarn package manager
sudo npm install -g yarn

# HTOP System Monitor
echo "Install HTOP"
sudo dnf install htop

# Podman Docker
echo "Install Podman Docker"
#sudo dnf install podman
