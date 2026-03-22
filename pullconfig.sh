#!/bin/bash

# File to copy the configs into the Repo


# Windows Pull Stuff
windows() {
	echo Pulling on Windows

	# SX
  echo Pulling SX Config
	cp ~/sx.conf SX
	cp ~/sx-message.txt SX

	# Applaunscher
  echo Pulling Applaunscher Config
	cp ~/AppData/Roaming/applaunscher/applaunscher.library.json Applaunscher

  # ShareX
  echo Pulling ShareX Config
  cp ~/Documents/ShareX/ApplicationConfig.json ShareX
  cp ~/Documents/ShareX/HotkeysConfig.json ShareX

  # VS-Code
  echo Pulling VS-Code Config
  cp ~/AppData/Roaming/Code/User/settings.json VS-Code
  cp -r ~/AppData/Roaming/Code/User/snippets/ VS-Code/snippets/

  # VS-Code Insiders
  echo Pulling VS-Code Insiders Config
  cp "$USERPROFILE/AppData/Roaming/Code - Insiders/User/settings.json" VS-Code-Insiders
  cp -r "$USERPROFILE/AppData/Roaming/Code - Insiders/User/snippets" VS-Code-Insiders/snippets/

  # Godot
  echo Pulling Godot Config
  mkdir -p Godot/script_templates
  cp -r ~/AppData/Roaming/Godot/script_templates Godot/script_templates
}


# Windows Push Stuff
# (from the repo to the used destination)
windowspush() {
  echo Push Config on Windows

  # Push SX
  echo Push SX Config
  cp SX/sx.conf ~
	cp SX/sx-message.txt ~

  # ShareX
  echo Push ShareX Config
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
  echo Pull SX Config
  cp ~/sx.conf SX
	cp ~/sx-message.txt SX
}


# Linux Push Stuff
# (from the repo to the used destination)
linuxpush() {
  echo Push Config on Linux

  # Push SX
  echo Push SX Config
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
