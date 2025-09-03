-- Lua API from Rust
local dapi = require("dapi")

-- Download SetPath Powershell Script
dapi.download("https://raw.githubusercontent.com/ShadowDara/dotfiles/refs/heads/main/install-scripts/setpath.ps1", "setpath.ps1")
dapi.download("https://raw.githubusercontent.com/ShadowDara/dotfiles/refs/heads/main/install-scripts/add_to_autostart.ps1", "add_to_autostart.ps1")

-- Open CMD on Hotkey
dapi.download("https://github.com/ShadowDara/open-cmd-on-Hotkey/releases/download/1.1/open_terminal_from_explorer_on_win+t.exe", "open_terminal_from_explorer_on_win+t.exe")

-- Download Tool Scripts
dapi.download("https://raw.githubusercontent.com/ShadowDara/dotfiles/refs/heads/main/minecraft/README.md", "minecraft/README.md")
dapi.download("https://raw.githubusercontent.com/ShadowDara/dotfiles/refs/heads/main/minecraft/replay_mod_converter.py", "minecraft/replay_mod_converter.py")
