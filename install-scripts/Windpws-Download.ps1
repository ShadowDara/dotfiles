# Powershell 7 Download Script
# For Some Portable Programms

# Zielverzeichnis (hier: aktuelles Verzeichnis)
$basePath = "."  # ggf. anpassen

Invoke-WebRequest -Uri "https://raw.githubusercontent.com/ShadowDara/dotfiles/refs/heads/main/LICENSE", -OutFile "$basePath/LICENSE"

# JarDownloader
Invoke-WebRequest -Uri "https://github.com/ShadowDara/jar-downloader/releases/download/v0.1.3/videoconverter-0.1.5-SNAPSHOT.jar" -OutFile "$basePath/videoconverter.jar"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/ShadowDara/jar-downloader/refs/heads/master/jardownloader.cmd" -OutFile "$basePath/jardownloader.cmd"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/ShadowDara/jar-downloader/refs/heads/master/jardownloader" -OutFile "$basePath/jardownloader"

# VideoConverter
Invoke-WebRequest -Uri "https://github.com/ShadowDara/videoconverter/releases/download/v0.1.5/videoconverter-0.1.5-SNAPSHOT.jar" -OutFile "$basePath/videoconverter.jar"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/ShadowDara/videoconverter/refs/heads/master/videoc.cmd" -OutFile "$basePath/videoc.cmd"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/ShadowDara/videoconverter/refs/heads/master/videoc" -OutFile "$basePath/videoc"

# FS-Tools
Invoke-WebRequest -Uri "https://github.com/ShadowDara/fs-tools/releases/download/v0.1.2/fs-tools-0.1.2-SNAPSHOT.jar" -OutFile "$basePath/fs-tools.jar"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/ShadowDara/fs-tools/refs/heads/master/fs.cmd" -OutFile "$basePath/fs.cmd"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/ShadowDara/fs-tools/refs/heads/master/fs" -OutFile "$basePath/fs"

# File Mirror
Invoke-WebRequest -Uri "https://github.com/ShadowDara/file-mirror/releases/download/v0.1.1/file-mirror-0.1.1-SNAPSHOT.jar" -OutFile "$basePath/file-mirror.jar"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/ShadowDara/file-mirror/refs/heads/master/fmirror.cmd" -OutFile "$basePath/fmirror.cmd"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/ShadowDara/file-mirror/refs/heads/master/fmirror" -OutFile "$basePath/fmirror"

# Windows Stuff - Terminals
Invoke-WebRequest -Uri "https://github.com/ShadowDara/dotfiles/releases/download/open-wt-hotkey/open_wt_on_winz.exe" -OutFile "$basePath/open_wt_on_winz.exe"
Invoke-WebRequest -Uri "https://github.com/ShadowDara/open-cmd-on-Hotkey/releases/download/1.1/open_terminal_from_explorer_on_win+t.exe" -OutFile "$basePath/open_terminal_from_explorer_on_win+t.exe"

Invoke-WebRequest -Uri "https://raw.githubusercontent.com/ShadowDara/dotfiles/refs/heads/main/scripts/GithubTools.psm1", -OutFile "$basePath/GithubTools.psm1"

# Release Download Module
$modulUrl = "https://raw.githubusercontent.com/ShadowDara/dotfiles/refs/heads/main/scripts/GithubTools.psm1"
$modulPfad = "./GitHubTools.psm1"

if (-Not (Test-Path $modulPfad)) {
    Invoke-WebRequest -Uri $modulUrl -OutFile $modulPfad
}

Import-Module $modulPfad

# Use Imported Module
Get-GitHubReleaseAsset -Repo "shadowdara/LuaAPI-Rust" -AssetName "luajit-windows-x86_64.exe"
