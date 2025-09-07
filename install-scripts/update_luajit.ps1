# Update LuaJIT to the latest version
# by Shadowdara 2025 MIT

Remove-Item -Path "luajit.exe" -ErrorAction SilentlyContinue
Rename-Item -Path "luajit-windows-x86_64.exe" -NewName "luajit.exe" -Force
Write-Host "Updated LuaJIT to the latest version."
