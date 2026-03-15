@echo off

if "%~1"=="" (
    echo Please an Folder as First Argument.
    echo Example: addpath.bat C:\Tools\ffmpeg\bin
    exit /b 1
)

set "NEWPATH=%~1"

for /f "tokens=2*" %%A in (
'reg query HKCU\Environment /v PATH 2^>nul'
) do set "CURPATH=%%B"

echo ;%CURPATH%; | find /I ";%NEWPATH%;" >nul
if %ERRORLEVEL%==0 (
    echo Already in Path!.
) else (
    set "NEWFULL=%CURPATH%;%NEWPATH%"
    reg add HKCU\Environment /v PATH /t REG_EXPAND_SZ /d "%NEWFULL%" /f
    echo PATH extended.
)

echo Start a new Console to make it activ
