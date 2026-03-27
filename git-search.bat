@echo off
setlocal enabledelayedexpansion

rem Script to search through all directories on Windows for Git Directories

:: Speicherort für die Ausgabe
set OUTPUT_FILE=%USERPROFILE%\git_dirs_found.txt

:: Bestehende Datei löschen, falls vorhanden
if exist "%OUTPUT_FILE%" del "%OUTPUT_FILE%"

echo Suche nach .git-Verzeichnissen auf dem System...
echo Dies kann einige Zeit dauern. Bitte warten...

:: Durchsuche alle Laufwerke
for %%D in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist "%%D:\" (
        echo Durchsuche Laufwerk %%D:\
        dir /s /b /ad "%%D:\.git" 2>nul >> "%OUTPUT_FILE%"
    )
)

echo Suche abgeschlossen!
echo Gefundene .git-Verzeichnisse wurden gespeichert in: %OUTPUT_FILE%

pause
