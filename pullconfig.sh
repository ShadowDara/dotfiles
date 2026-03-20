#!/bin/bash

# File to copy the configs into the Repo

# Windows Pull Stuff
windows() {
	echo Pulling on Windows

	# SX
	cp ~/sx.conf SX
	cp ~/sx-message.txt SX

	# Applaunscher
	cp ~/AppData/Roaming/applaunscher/applaunscher.library.json Applaunscher
}

# Linux Pull Stuff
linux() {
	echo Pulling on Linux

	# Pull Neovim Config
	mkdir -p neovim
	# Using via System Links
    rm -rf ~/.config/nvim
    ln -s ~/dotfiles/nvim ~/.config/nvim
}

funktion3() {
  echo "Du hast Funktion 3 gewählt"
}

PS3="Bitte wähle eine Option: "

select option in "Windows" "Linux" "Funktion 3"
do
  case $REPLY in
    1) windows; break ;;
    2) linux; break ;;
    3) funktion3 ;;
    *) echo "Ungültig"; break ;;
  esac
done
