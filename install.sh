#!/usr/bin/env bash
set -euxo pipefail

# ***********************************
# Dotfiles Installations-Skript
# NUR FÜR CODESPACES!!!
# by Shadowdara
# ***********************************

# Dotfiles-Verzeichnis (anpassen!)
DOTFILES_DIR=$HOME/.dotfiles

# Symbolic Links erstellen
ln -sf $DOTFILES_DIR/configs/.gitconfig $HOME/.gitconfig

# htop installieren
sudo apt update
sudo apt install -y htop

# Ruby & Bundler prüfen
if ! command -v bundle &> /dev/null; then
  sudo apt install -y ruby-full build-essential zlib1g-dev
  gem install bundler
fi

# Jekyll dependencies
bundle install || echo "bundle install failed or not needed"

# Rust installieren
if ! command -v rustc &> /dev/null; then
  echo "🔧 Installing Rust..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  source "$HOME/.cargo/env"
else
  echo "Rust already installed."
fi

# Install Bun
curl -fsSL https://bun.sh/install | bash

source ~/.bashrc

echo "Dotfiles setup completed!"
