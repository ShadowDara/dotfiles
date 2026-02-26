# Powershell source File for windows

# Minimal profile: UTF‑8 + Oh My Posh (if installed) + Fastfetch with explicit config path
try {
    [Console]::InputEncoding  = [System.Text.Encoding]::UTF8
    [Console]::OutputEncoding = [System.Text.Encoding]::UTF8
    $OutputEncoding = [System.Text.UTF8Encoding]::new($false)
    chcp 65001 > $null
} catch {}

# Entfernt den Standardalias 'cls' dauerhaft
if (Test-Path Alias:\cls) {
    Remove-Item Alias:\cls -Force
}

Clear-Host

# Force Fastfetch to use YOUR config every time (bypass path confusion)
if (Get-Command fastfetch -ErrorAction SilentlyContinue) {
    fastfetch -c "C:/Users/schueler/.config/fastfetch/config.jsonc"
}

function cls {
	Clear-Host
	#Write-Host "Aufgeräumt — bereit." -ForegroundColor Green
	if (Get-Command fastfetch -ErrorAction SilentlyContinue) {
		fastfetch -c "C:/Users/schueler/.config/fastfetch/config.jsonc"
	}
}

# Requires Path Viewer
# https://github.com/ShadowDara/Path-Viewer
function path {
	Start-Process "$env:USERPROFILE\Documents\Programms\path-viewer_x64.exe"
}

# To use bash

Clear-Host

bash
