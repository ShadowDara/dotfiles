@echo off

set URL=link
set ZIEL=file

echo Lade %URL% runter
curl -L -o %ZIEL% %URL%

echo Fertig! Datei gespeichert als %ZIEL%
pause
