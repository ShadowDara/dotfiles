# Powershell Script which searches for Java 21 installations
# by Shadowdara 2025 MIT

$version = $args[0]

Write-Host "Searching for Java $version installations..."

Set-Content -Path "java.$version.txt.dumb" -Value ""

Get-ChildItem -Path C:\ -Filter java.exe -Recurse -Force -ErrorAction SilentlyContinue |
  ForEach-Object {
    $path = $_.FullName
    $versionOutput = & "$path" -version 2>&1 | Select-String "version"
    
    if ($versionOutput -match 'version\s+"(' + $version + '.*?)"') {
        [PsCustomObject]@{
            Path    = $path
            Version = $matches[1]
        }
        Add-Content -Path "C:\Temp\beispiel.txt" -Value $path
    }
  } | Format-Table -AutoSize

Write-Host "Finished Searching."
