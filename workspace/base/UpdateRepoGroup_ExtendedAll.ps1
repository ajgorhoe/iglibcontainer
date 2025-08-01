
# Clones or updates the IGLib Framework ALL repositories in iglibmodules.
Write-Host "`n`nCloning / updating ALL IGLib Framework repositories with workapaceprojects ...`n"

# Get the script directory such that relative paths can be resolved:
$scriptPath = $MyInvocation.MyCommand.Path
$scriptDir = Split-Path $scriptPath -Parent
$scriptFilename = [System.IO.Path]::GetFileName($scriptPath)



# Then, update ../../workspaceprojects with submodules:
Write-Host "`nUpdating workspaceprojects with submodules:"
& $(Join-Path $scriptDir "UpdateRepo_workspaceprojectsWithSubmodules.ps1")

Write-Host "Script directory: $scriptDir"

# First, update group of IGLib Framework's extended repositories.
# This will also update IGLib basic and Framework extended repositories
# (scripts UpdateRepos_Basic.ps1 and )
& $(join-path $scriptDir "UpdateRepoGroup_Extended.ps1")



Write-Host "  ... updating all IGLib Framework repositories complete.`n`n"

