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

# Windows Push Stuff
windowspush() {
    echo Push Config on Windows

    # Push SX
    cp SX/sx.conf ~
	cp SX/sx-message.txt ~
}

# Linux Pull Stuff
linux() {
	echo Pulling on Linux

	# Pull Neovim Config
	mkdir -p neovim
	# Using via System Links
    rm -rf ~/.config/nvim
    ln -s ~/dotfiles/nvim ~/.config/nvim

    # Pull SX
    cp ~/sx.conf SX
	cp ~/sx-message.txt SX
}

# Linux Push Stuff
linuxpush() {
    echo Push Config on Linux

    # Push SX
    cp SX/sx.conf ~
	cp SX/sx-message.txt ~
}

funktion3() {
  echo "Du hast Funktion 3 gewählt"
}

PS3="Bitte wähle eine Option: "

select option in "Windows" "Linux" "Push Windows" "Push Linux"
do
  case $REPLY in
    1) windows; break ;;
    2) linux; break ;;
    3) windowspush; break ;;
    4) linuxpush; break ;;
    *) echo "Wrong decision"; break ;;
  esac
done
