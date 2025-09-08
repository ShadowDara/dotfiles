#!/usr/bin/env bash
set -e

# Dotfiles-Verzeichnis
DOTFILES_DIR=$HOME/dotfiles

# Symbolic Links erstellen
#ln -sf $DOTFILES_DIR/.zshrc $HOME/.zshrc
ln -sf $DOTFILES_DIR/.gitconfig $HOME/.gitconfig
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

echo "Dotfiles installiert ✅"
