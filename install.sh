#!/usr/bin/env bash
set -e

# Dotfiles-Verzeichnis
DOTFILES_DIR=$HOME/dotfiles

# Symbolic Links erstellen
#ln -sf $DOTFILES_DIR/.zshrc $HOME/.zshrc
ln -sf $DOTFILES_DIR/.gitconfig $HOME/.gitconfig
#ln -sf $DOTFILES_DIR/.vimrc $HOME/.vimrc

echo "Dotfiles installiert ✅"
