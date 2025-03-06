
# Clones or updates all repositories contained in this directory.
Write-Host "`n`nCloning / updating all repositories in this directory ...`n"

# Get the script directory such that relative paths can be resolved:
$scriptPath = $MyInvocation.MyCommand.Path
$scriptDir = Split-Path $scriptPath -Parent
$scriptFilename = [System.IO.Path]::GetFileName($scriptPath)

Write-Host "Script directory: $scriptDir"

Write-Host "`nUpdating workspaceprojects:"
& $(Join-Path $scriptDir "UpdateRepo_workspaceprojects.ps1")

Write-Host "`nUpdating workspaceprojects_all:"
& $(Join-Path $scriptDir "UpdateRepo_workspaceprojects_all.ps1")

Write-Host "  ... updating basic repositoris in the current directory completed.`n`n"

