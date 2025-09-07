# Powershell Script which downloads the latest release asset from a GitHub repository
# by Shadowdara 2025 MIT

param (
    [string]$Repo = $args[0],  # e.g., "LuaJIT/LuaJIT"
    [string]$AssetName = $args[1] # e.g., "luajit-2.1.0-beta3.zip"
)

$release = Invoke-RestMethod -Uri "https://api.github.com/repos/$Repo/releases/latest" -Headers @{ "User-Agent" = "PowerShell" }
$tag = $release.tag_name
$url = "https://github.com/$Repo/releases/download/$tag/$AssetName"

Write-Host "Neuster Release-Tag: $tag"
Write-Host "Download-URL: $url"

Invoke-WebRequest -Uri $url -OutFile $AssetName
