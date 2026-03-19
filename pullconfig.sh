#!/bin/bash

# File to copy the configs into the Repo

# Windows Pull Stuff
windows() {
	echo Pulling on Windows
	
	# SX
	cp ~/sx.conf SX
	cp ~/sx-message.txt SX
}

# Linux Pull Stuff
linux() {
	echo Pulling on Linux

	# Pull Neovim Config
	mkdir -p neovim
	cp ~/.config/nvim/init.vim neovim/init.vim
	cp ~/.config/nvim/init.vim neovim/init.lua
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

