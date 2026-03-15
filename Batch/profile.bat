@echo off
chcp 65001 >nul

rem bessere Variablenverarbeitung
setlocal EnableExtensions EnableDelayedExpansion

rem Prompt anpassen
prompt $e[32m$P$G$e[0m

rem praktische Aliase (DOSKEY Macros)
doskey ls=dir /B
doskey ll=dir
doskey la=dir /A
doskey clear=cls
doskey grep=findstr $*

rem Git shortcuts
doskey gs=git status
doskey ga=git add $*
doskey gc=git commit -m "$*"

rem Navigation
doskey ..=cd ..
doskey ...=cd ..\..

rem Editor shortcut
doskey e=notepad $*

rem Schneller Ordner Wechsel
doskey desk=cd %USERPROFILE%\Desktop
doskey dl=cd %USERPROFILE%\Downloads

rem häufige Tools in PATH (optional)
rem set "PATH=%PATH%;C:\Tools\bin"

rem Bigger History
doskey /listsize=1000

rem Load the File Automatily
rem reg add HKCU\Software\Microsoft\Command Processor /v AutoRun /d "C:\cmd_profile.bat" /f

fastfetch

echo CMD Profil geladen.

cmd /k
