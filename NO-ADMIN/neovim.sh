# Install NeoVim without Sudo

mkdir -p ~/apps/nvim
cd ~/apps/nvim

# Lade die neueste AppImage-Version herunter (hier v0.9.5 als Beispiel)
wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.appimage

# Mach die Datei ausführbar
chmod u+x nvim.appimage

# Optional: extrahiere AppImage für bessere Integration (nicht notwendig)
./nvim.appimage --appimage-extract
