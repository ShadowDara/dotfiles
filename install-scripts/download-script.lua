-- Lua API from Rust
local dapi = require("dapi")
local dapi_io = require("dapi_io")

-- Downloading

-- SetPath
dapi.download("https://raw.githubusercontent.com/ShadowDara/dotfiles/refs/heads/main/install-scripts/setpath.ps1", "setpath.ps1")
-- Add Autostart
dapi.download("https://raw.githubusercontent.com/ShadowDara/dotfiles/refs/heads/main/install-scripts/add_to_autostart.ps1", "add_to_autostart.ps1")
-- Download Release
dapi.download("https://raw.githubusercontent.com/ShadowDara/dotfiles/refs/heads/main/install-scripts/download_release.ps1", "download_release.ps1")
-- Update Script
dapi.download("https://raw.githubusercontent.com/ShadowDara/dotfiles/refs/heads/main/install-scripts/update_luajit.ps1", "update_luajit.ps1")

print("Run ./update_luajit.ps1 to update LuaJIT to the latest version!")

-- Open CMD on Hotkey
dapi.download("https://github.com/ShadowDara/open-cmd-on-Hotkey/releases/download/1.1/open_terminal_from_explorer_on_win+t.exe", "open_terminal_from_explorer_on_win+t.exe")

-- Download Tool Scripts
dapi_io.create_dir("minecraft")
dapi.download("https://raw.githubusercontent.com/ShadowDara/dotfiles/refs/heads/main/minecraft/README.md", "minecraft/README.md")
dapi.download("https://raw.githubusercontent.com/ShadowDara/dotfiles/refs/heads/main/minecraft/replay_mod_converter.py", "minecraft/replay_mod_converter.py")
dapi.download("https://raw.githubusercontent.com/ShadowDara/dotfiles/refs/heads/main/minecraft/paper_to_vanilla_world", "minecraft/paper_to_vanilla_world.py")

-- Download FS-Tools
-- Soon
