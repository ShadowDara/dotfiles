# Powershell Function to download a specific asset from the latest release of a GitHub repository
# Usage: Get-GitHubReleaseAsset -Repo "user/repo" -AssetName
# Example: Get-GitHubReleaseAsset -Repo "LuaJIT/LuaJIT" -AssetName "luajit-2.1.0-beta3.zip"

function Get-GitHubReleaseAsset {
    <#
    .SYNOPSIS
        Lädt einen bestimmten Asset aus dem neuesten Release eines GitHub-Repositories herunter.

    .PARAMETER Repo
        Das GitHub-Repository im Format "user/repo", z. B. "LuaJIT/LuaJIT"

    .PARAMETER AssetName
        Der exakte Name der Asset-Datei im Release, z. B. "luajit-2.1.0-beta3.zip"

    .PARAMETER OutputPath
        (Optional) Pfad, unter dem die Datei gespeichert werden soll. Standard ist das aktuelle Verzeichnis.

    .EXAMPLE
        Get-GitHubReleaseAsset -Repo "LuaJIT/LuaJIT" -AssetName "luajit-2.1.0-beta3.zip"
    #>

    param (
        [Parameter(Mandatory = $true)]
        [string]$Repo,

        [Parameter(Mandatory = $true)]
        [string]$AssetName,

        [string]$OutputPath = "."
    )

    try {
        $release = Invoke-RestMethod -Uri "https://api.github.com/repos/$Repo/releases/latest" -Headers @{ "User-Agent" = "PowerShell" }
    }
    catch {
        Write-Error "Fehler beim Abrufen der Release-Informationen: $_"
        return
    }

    $tag = $release.tag_name
    $url = "https://github.com/$Repo/releases/download/$tag/$AssetName"
    $fullPath = Join-Path $OutputPath $AssetName

    Write-Host "📦 Repo:        $Repo"
    Write-Host "🏷️  Release:     $tag"
    Write-Host "🔗 Download:    $url"
    Write-Host "💾 Targetpath:    $fullPath"

    try {
        Invoke-WebRequest -Uri $url -OutFile $fullPath
        Write-Host "✅ Download finished: $AssetName"
    }
    catch {
        Write-Error "❌ Error downloading: $_"
    }
}
