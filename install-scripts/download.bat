@echo off

set URL=link
set ZIEL=file

echo Lade %URL% runter
curl -L -o %ZIEL% %URL%

echo Fertig! Datei gespeichert als %ZIEL%

set URL2=
set ZIEL2=

echo Lade %URL2% runter
curl -L -o %ZIEL2% %URL2%

echo Fertig! Datei gespeichert als %ZIEL2%

pause

