@echo off

rem Clear the Screen
cls

rem Just for fun lol
title HACK

rem Enable ANSI
rem reg add HKCU\Console /v VirtualTerminalLevel /t REG_DWORD /d 1 /f

rem Load the File Automatily
rem But do not do this
rem reg add "HKCU\Software\Microsoft\Command Processor" /v AutoRun /t REG_SZ /d "C:\Users\schueler\Downloads\dotfiles\Batch\profile.bat" /f

rem set the encoding to utf-8
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

doskey ep=explorer .

rem häufige Tools in PATH (optional)
rem set "PATH=%PATH%;C:\Tools\bin"

rem Bigger History
doskey /listsize=1000

fastfetch

echo loaded CMD Profile.

for %%i in ("%~dp0..\Birthday\app.ts") do set APP=%%~fi
bun "%APP%" week
doskey birth=bun %APP% $*

rem This would create a loop
rem cmk /k
