# Set path Variable Powershell script
# by Shadowdara 2025 MIT

# 1. Argument: Pfad
# 2. Argument: "User", "Machine" oder "Process"

$neuerPfad = $args[0]
$scope = $args[1]

if ($scope -ne "User" -and $scope -ne "Machine" -and $scope -ne "Process") {
    Write-Host "unallowed Scope: $scope. Allowed: User, Machine, Process."
    exit 1
}

# Alten PATH lesen und neuen anhängen
$alterPath = [Environment]::GetEnvironmentVariable("PATH", $scope)
$neuerGesamtPfad = "$alterPath;$neuerPfad"

# Setzen
[Environment]::SetEnvironmentVariable("PATH", $neuerGesamtPfad, $scope)

Write-Host "PATH added for Scope '$scope'."

