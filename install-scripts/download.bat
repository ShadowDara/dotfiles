@echo off

set URL= https://github.com/shadowdara/LuaAPI-Rust/releases/download/v0.1.7/luajit-windows-x86_64.exe
set ZIEL=luajit.exe

echo Lade %URL% runter
curl -L -o %ZIEL% %URL%

echo Fertig! Datei gespeichert als %ZIEL%

set URL2=https://raw.githubusercontent.com/ShadowDara/dotfiles/refs/heads/main/install-scripts/download-script.lua
set ZIEL2=download-script.lua

echo Lade %URL2% runter
curl -L -o %ZIEL2% %URL2%

echo Fertig! Datei gespeichert als %ZIEL2%

echo Starte Download Script

call ./luajit.exe download-script.lua

echo Updating Dapi

call ./update_luajit.ps1

echo Running 2nd part of the script

call ./luajit.exe download-script-full.lua

pause

