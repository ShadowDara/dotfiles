-- Requires Dapi V0.1.8

-- Lua API from Rust
local dapi = require("dapi")
local dapi_io = require("dapi_io")
local dapi_os = require("dapi_os")

-- Downloading

-- Download Release
dapi.download("https://raw.githubusercontent.com/ShadowDara/dotfiles/refs/heads/main/install-scripts/download_release.ps1", "download_release.ps1")
-- SetPath
dapi.download("https://raw.githubusercontent.com/ShadowDara/dotfiles/refs/heads/main/install-scripts/setpath.ps1", "setpath.ps1")
-- Add Autostart
dapi.download("https://raw.githubusercontent.com/ShadowDara/dotfiles/refs/heads/main/install-scripts/add_to_autostart.ps1", "add_to_autostart.ps1")

-- Download Open CMD on Hotkey
dapi.download("https://github.com/ShadowDara/open-cmd-on-Hotkey/releases/download/1.1/open_terminal_from_explorer_on_win+t.exe", "open_terminal_from_explorer_on_win+t.exe")
-- Download Open WT on Hotkey
dapi.download("https://github.com/ShadowDara/dotfiles/releases/download/open-wt-hotkey/open_wt_on_winz.exe", "open_wt_from_explorer_on_win+z.exe")

-- Download Minecraft Scripts
dapi_io.create_dir("minecraft")
dapi.download("https://raw.githubusercontent.com/ShadowDara/dotfiles/refs/heads/main/minecraft/README.md", "minecraft/README.md")
dapi.download("https://raw.githubusercontent.com/ShadowDara/dotfiles/refs/heads/main/minecraft/replay_mod_converter.py", "minecraft/replay_mod_converter.py")
dapi.download("https://raw.githubusercontent.com/ShadowDara/dotfiles/refs/heads/main/minecraft/paper_to_vanilla_world", "minecraft/paper_to_vanilla_world.py")

-- Download FS-Tools
dapi_os.run("powershell ./download_release.ps1 shadowdara/fs-tools fs-tools.jar")
dapi.download("https://raw.githubusercontent.com/ShadowDara/fs-tools/refs/heads/master/winstall.lua", "winstall.lua")

-- Run FS-Tools Installer
print("[INFO] Running FS-Tools installer... JAVA 21 REQUIRED!")
dapi_os.run("luajit.exe winstall.lua")

-- ADD TO AUTOSTART
dapi_os.run("powershell ./add_to_autostart.ps1 open_terminal_from_explorer_on_win+t.exe")
dapi_os.run("powershell./add_to_autostart.ps1 open_wt_from_explorer_on_win+z.exe")

-- ADD TO PATH
--dapi_os.run("./setpath.ps1 .")
