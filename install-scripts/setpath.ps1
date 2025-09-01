# Set path Variable Powershell script
# by Shadowdara 2025 MIT
# 1 Argument: PATH
# 2 Argument: Username

$user = $args[1]

[Environment]::SetEnvironmentVariable("PATH", $env:PATH + ";" + $args[0], $user)

