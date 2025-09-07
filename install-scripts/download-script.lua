-- Requires Dapi V0.1.5

-- Lua API from Rust
local dapi = require("dapi")

-- LICENSE
dapi.download("https://raw.githubusercontent.com/ShadowDara/dotfiles/refs/heads/main/LICENSE", "LICENSE")

-- Update Dapi
dapi.download("https://raw.githubusercontent.com/ShadowDara/dotfiles/refs/heads/main/install-scripts/update_luajit.ps1", "update_luajit.ps1")

print("[INFO] Run powershell ./update_luajit.ps1 to update LuaJIT to the latest version!")

dapi.download("https://raw.githubusercontent.com/ShadowDara/dotfiles/refs/heads/main/install-scripts/download-script-full.lua", "download-script-full.lua")
