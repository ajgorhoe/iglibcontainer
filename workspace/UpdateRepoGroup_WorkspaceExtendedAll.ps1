
# Clones or updates the basic repositories in ws/workspace.

# Get the script directory such that relative paths can be resolved:
$scriptPath = $MyInvocation.MyCommand.Path
$scriptDir = Split-Path $scriptPath -Parent
$scriptFilename = [System.IO.Path]::GetFileName($scriptPath)

Write-Host "`nCloning/updating EXTENDED WORKSPACE repositories:`n"
Write-Host "Script directory: $scriptDir"

Write-Host "`nUpdating develop_cobik:"
& $(Join-Path $scriptDir "UpdateRepo_develop_cobik.ps1")

Write-Host "`nUpdating IGLibScripts:"
& $(Join-Path $scriptDir "UpdateRepo_IGLibScripts.ps1")


# Also update the BASIC workspace repositories:
& $(Join-Path $scriptDir "UpdateRepoGroup_WorkspaceBasic.ps1")


# Finally, also update ../workspaceprojects/ eith submodules:
& $(Join-Path $scriptDir "../UpdateReposGroup_WorkspaceProjectsWithSubmodules.ps1")


Write-Host "  ... updating extended workspace repositories completed.`n`n"

