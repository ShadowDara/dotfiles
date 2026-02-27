# ~/.bashrc
#
# Bashrc File
#
# my Personal Mono Bash Config because i dont want to multiple
# bashrc files over different Operating Systems


# Set false on Termux
fastfetchlogo=true


# Git Prompt nur laden wenn vorhanden
#
# To disable a Git Bash Error Message on Windows
#
if [ -f /etc/profile.d/git-prompt.sh ]; then
    . /etc/profile.d/git-prompt.sh
fi

if type __git_ps1 &>/dev/null; then
    PS1='\[\e[32m\]\u@\h \[\e[35m\]\W$(__git_ps1 " (%s)")\[\e[0m\]\$ '
else
    PS1='\u@\h \W\$ '
fi


# Function to install everything
my_setup_termux() {
    echo Running Setup for Termux

    # Update existing packages
    pkg upgrade

    pkg install x11-repo
    pkg install science-repo
    pkg install fastfetch
    pkg install make
    pkg install git
    pkg install hollywood
    pkg install golang
    pkg install neovim
    pkg install python-pip

    # Infos
    # Flutter doesnt work in Termux!
    # I already tried that!

    # Update existing packages
    pkg upgrade

    # Reload the File
    source ~/.bashrc
}


# POPOS
my_setup_popos() {
    sudo apt install golang-go
}


# Function to update my own Programms and although other
# Stuff
my_update() {
    echo Updating Finder
    go install github.com/shadowdara/finder/cmd/finder@latest

    # Reload the File
    source ~/.bashrc
}


# Function to clear the screens
cls() {
    clear
}


# OS Detection
OS="$(uname)"

case "$OS" in
    Linux*)
        PLATFORM="Linux"
        ;;

    Darwin*)
        PLATFORM="macOS"
        ;;

    MINGW*|MSYS*|CYGWIN*)
        PLATFORM="Windows"
        ;;

    *)
        PLATFORM="Unknown"
        ;;
esac


#echo "Running on $PLATFORM"


# Windows check (Git Bash / MINGW)
if [[ $PLATFORM == "Windows" ]]; then
    # Make Windows Specific Path Stuff here
    # echo Hallo Windows
    echo
elif [[ $PLATFORM == "Linux" ]]; then
    # Linux Specific Stuff
    # echo Hallo Linux
    echo
fi


# ##
#
#
# Path Sepcific Stuff here
#
#
#
# ###


# End

if [[ "$fastfetchlogo" == "true" ]]; then
    # Start Fastfetch to print system Infos
    fastfetch
else
    # Start Fastfetch to print system Infos but without a logo
    # because of smaller screens
    fastfetch --logo none
fi


# Modify the Path Variables
# $PATH = $PATH + ":C:\Users\schueler\Documents\PowerShell"


echo System Name:
uname
