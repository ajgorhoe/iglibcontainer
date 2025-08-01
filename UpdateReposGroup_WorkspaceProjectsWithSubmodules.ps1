
# Clones or updates all repositories contained in this directory.

# Get the script directory such that relative paths can be resolved:
$scriptPath = $MyInvocation.MyCommand.Path
$scriptDir = Split-Path $scriptPath -Parent
$scriptFilename = [System.IO.Path]::GetFileName($scriptPath)

Write-Host "`nCloning / updating WorkspaceProjects WITH SUBMODULES ...`n"
Write-Host "Script directory: $scriptDir"

Write-Host "`nUpdating workspaceprojects CONTAINER:"
& $(Join-Path $scriptDir "UpdateRepo_workspaceprojects.ps1")

# REMARK: workspaceprojects_all mainly not used,
# Write-Host "`nUpdating workspaceprojects_all:"
# & $(Join-Path $scriptDir "UpdateRepo_workspaceprojects_all.ps1")

# Update the relevant submodules in workspaceprojects:
& $(Join-Path $scriptDir "workspaceprojects/UpdateRepoGroup_WorkspaceProjects.ps1")

Write-Host "  ... updating basic repositoris in the current directory completed.`n`n"

