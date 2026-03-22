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

  # ShareX
  cp ~/Documents/ShareX/ApplicationConfig.json ShareX
  cp ~/Documents/ShareX/HotkeysConfig.json ShareX
}


# Windows Push Stuff
# (from the repo to the used destination)
windowspush() {
  echo Push Config on Windows

  # Push SX
  cp SX/sx.conf ~
	cp SX/sx-message.txt ~

  # ShareX
  mkdir -p ~/Documents/ShareX
  cp ShareX/ApplicationConfig.json ~/Documents/ShareX
  cp ShareX/HotkeysConfig.json ~/Documents/ShareX
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
# (from the repo to the used destination)
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
