# Ps1 Script to add a Programm to autostart
# by Shadowdara 2025 MIT

if ($args.Count -gt 0) {
    # Do nothing
} else {
    Write-Host "Kein Argument übergeben"
    exit 1
}

# Path were the executable is
$TargetPath = $args[0]

$WshShell = New-Object -ComObject WScript.Shell
$ShortcutPath = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\MeinApp.lnk"

$Shortcut = $WshShell.CreateShortcut($ShortcutPath)
$Shortcut.TargetPath = $TargetPath
$Shortcut.Save()

