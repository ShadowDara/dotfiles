@echo off

set URL=link
set ZIEL=luajit.exe

echo Lade %URL% runter
curl -L -o %ZIEL% %URL%

echo Fertig! Datei gespeichert als %ZIEL%

set URL2=https://raw.githubusercontent.com/ShadowDara/dotfiles/refs/heads/main/install-scripts/download-script.lua
set ZIEL2=download-script.lua

echo Lade %URL2% runter
curl -L -o %ZIEL2% %URL2%

echo Fertig! Datei gespeichert als %ZIEL2%

pause

