
# Clones or updates all repositories contained in this directory.
Write-Host "`n`nCloning / updating all repositories in directory other/ ...`n"

# Get the script directory such that relative paths can be resolved:
$scriptPath = $MyInvocation.MyCommand.Path
$scriptDir = Split-Path $scriptPath -Parent
$scriptFilename = [System.IO.Path]::GetFileName($scriptPath)

Write-Host "Script directory: $scriptDir"

Write-Host "`nUpdating iglibmodules:"
& $(Join-Path $scriptDir "UpdateRepo_iglibmodules.ps1")

Write-Host "`nUpdating anka/iglibmodules_anka:"
& $(Join-Path $scriptDir "anka/UpdateRepo_iglibmodules_anka.ps1")

Write-Host "`nUpdating learn_sluzba:"
& $(Join-Path $scriptDir "UpdateRepo_learn_sluzba.ps1")

Write-Host "  ... updating repositoris in the current directory completed.`n`n"

