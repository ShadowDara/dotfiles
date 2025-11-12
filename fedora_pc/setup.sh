#!/bin/bash

# Install Setup for Fedora
# by Shadowdara

# Task Manager
sudo dnf install htop

# Editor
sudo dnf install nvim

# System Infos
sudo dnf fastfetch

# Open SSL
sudo dnf install openssl-devel pkgconfig

# Add to bashrc
echo "fastfetch" >> ~/.bashrc

# Reload
source ~/.bashrc

# Finish
echo "Finished Installing"
