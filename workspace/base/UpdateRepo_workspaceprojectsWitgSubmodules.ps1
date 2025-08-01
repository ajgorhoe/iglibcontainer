
# Clones or updates the ../../workspaceprojects/ with submodules.
Write-Host "`n`nCloning / updating basic WORKSPACEPROJECTS with submodules ...`n"

# Get the script directory such that relative paths can be resolved:
$scriptPath = $MyInvocation.MyCommand.Path
$scriptDir = Split-Path $scriptPath -Parent
$scriptFilename = [System.IO.Path]::GetFileName($scriptPath)

Write-Host "Script directory: $scriptDir"

& $(Join-Path $scriptDir "../../UpdateReposGroup_WorkspaceProjectsWithSubmodules.ps1")

