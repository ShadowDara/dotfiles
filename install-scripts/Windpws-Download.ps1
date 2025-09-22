# Powershell 7 Download Script
# For Some Portable Programms

# Zielverzeichnis (hier: aktuelles Verzeichnis)
$basePath = "."  # ggf. anpassen

New-Item -Path "$basePath\\bin" -ItemType Directory
New-Item -Path "$env:USERPROFILE\\.dara\\psm" -ItemType Directory

Invoke-WebRequest -Uri "https://raw.githubusercontent.com/ShadowDara/dotfiles/refs/heads/main/LICENSE" -OutFile "$basePath/bin/LICENSE"

# JarDownloader
Invoke-WebRequest -Uri "https://github.com/ShadowDara/jar-downloader/releases/download/v0.1.3/jar-downloader-0.1.3-SNAPSHOT.jar" -OutFile "$basePath/bin/jardownloader.jar"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/ShadowDara/jar-downloader/refs/heads/master/jardownloader.cmd" -OutFile "$basePath/bin/jardownloader.cmd"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/ShadowDara/jar-downloader/refs/heads/master/jardownloader" -OutFile "$basePath/bin/jardownloader"

# VideoConverter
Invoke-WebRequest -Uri "https://github.com/ShadowDara/videoconverter/releases/download/v0.1.5/videoconverter-0.1.5-SNAPSHOT.jar" -OutFile "$basePath/bin/videoconverter.jar"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/ShadowDara/videoconverter/refs/heads/master/videoc.cmd" -OutFile "$basePath/bin/videoc.cmd"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/ShadowDara/videoconverter/refs/heads/master/videoc" -OutFile "$basePath/bin/videoc"

# FS-Tools
Invoke-WebRequest -Uri "https://github.com/ShadowDara/fs-tools/releases/download/v0.1.2/fs-tools-0.1.2-SNAPSHOT.jar" -OutFile "$basePath/bin/fs-tools.jar"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/ShadowDara/fs-tools/refs/heads/master/fs.cmd" -OutFile "$basePath/bin/fs.cmd"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/ShadowDara/fs-tools/refs/heads/master/fs" -OutFile "$basePath/bin/fs"

# File Mirror
Invoke-WebRequest -Uri "https://github.com/ShadowDara/file-mirror/releases/download/v0.1.1/file-mirror-0.1.1-SNAPSHOT.jar" -OutFile "$basePath/bin/file-mirror.jar"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/ShadowDara/file-mirror/refs/heads/master/fmirror.cmd" -OutFile "$basePath/bin/fmirror.cmd"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/ShadowDara/file-mirror/refs/heads/master/fmirror" -OutFile "$basePath/bin/fmirror"

# Windows Stuff - Terminals
Invoke-WebRequest -Uri "https://github.com/ShadowDara/dotfiles/releases/download/open-wt-hotkey/open_wt_on_winz.exe" -OutFile "$basePath/bin/open_wt_on_winz.exe"
Invoke-WebRequest -Uri "https://github.com/ShadowDara/open-cmd-on-Hotkey/releases/download/1.1/open_terminal_from_explorer_on_win+t.exe" -OutFile "$basePath/bin/open_terminal_from_explorer_on_win+t.exe"

# add Touch Windows
Invoke-WebRequest -Uri "https://github.com/ShadowDara/dotfiles/releases/download/w-touch-0.0.0/touch-windows.exe" -OutFile "$env:USERPROFILE\\.dara\\touch-windows.exe"

# Release Download Module
$modulUrl = "https://raw.githubusercontent.com/ShadowDara/dotfiles/refs/heads/main/scripts/GithubTools.psm1"
$modulPfad = "$env:USERPROFILE\\.dara\\psm\\GitHubTools.psm1"

if (-Not (Test-Path $modulPfad)) {
    Invoke-WebRequest -Uri $modulUrl -OutFile $modulPfad
}

Import-Module $modulPfad

# Use Imported Module
Get-GitHubReleaseAsset -Repo "shadowdara/LuaAPI-Rust" -AssetName "bin\\luajit-windows-x86_64.exe"

Invoke-WebRequest -Uri "https://i.redd.it/b6khq2gmbyo51.jpg" -OutFile "$env:USERPROFILE\\.dara\\windows_terminal_background_picture.jpg"

Copy-Item -Path "$basePath\bin\*" -Destination "$env:USERPROFILE\.dara" -Recurse

# Add to PATH
$env:Path += ";$env:USERPROFILE\.dara"

Invoke-WebRequest -Uri "https://raw.githubusercontent.com/ShadowDara/dotfiles/refs/heads/main/windows-terminal/settings.json" -OutFile "$env:USERPROFILE\\.dara\\settings.json"
