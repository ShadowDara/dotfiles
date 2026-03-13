:: /blog/2025/10/16/wifi-trick

@echo off

@rem by Shadowdara
@rem a script to read all saved SSIDs

setlocal EnableDelayedExpansion

for /f "tokens=2 delims=:" %%A in ('netsh wlan show profiles ^| findstr "Profil"') do (
    set "profilename=%%A"
    set "profilename=!profilename:~1!"

    echo -----------------------------
    echo Profil: !profilename!
    netsh wlan show profile name="!profilename!" key=clear | findstr "Schlüsselinhalt"
)
echo -----------------------------

echo.
echo Script ended
echo.
