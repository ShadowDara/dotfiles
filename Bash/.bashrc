# Bashrc File

# Function to update my own Programms and although other
# Stuff
my_update() {
    echo Updating Finder
    go install github.com/shadowdara/finder/cmd/finder@latest
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

echo "Running on $PLATFORM"

# Windows check (Git Bash / MINGW)
if [[ $PLATFORM == "Windows" ]]; then
    # Make Windows Specific Path Stuff here
    echo Hallo Windows
elif [[ $PLATFORM == "Linux" ]]; then
    # Linux Specific Stuff
    echo Hallo Linux
fi

fastfetch

echo System Name:
uname
