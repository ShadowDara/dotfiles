REM Update LuaJIT binary for Windows

call powershell -ExecutionPolicy Bypass -File "%~dp0download_release.ps1" "shadowdara/LuaAPI-Rust" "luajit-windows-x86_64.exe"

call powershell -ExecutionPolicy Bypass -File "%~dp0update_luajit.ps1"
exit /b 0
