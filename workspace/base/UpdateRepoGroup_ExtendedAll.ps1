
# Clones or updates ALL IGLib repositoeirs in workspaces/.
Write-Host "`n`nCloning / updating ALL IGLib repositories in base/"
Write-Host "  including the ../../workspaceprojects/ with submodules`n"

# Get the script directory such that relative paths can be resolved:
$scriptPath = $MyInvocation.MyCommand.Path
$scriptDir = Split-Path $scriptPath -Parent
$scriptFilename = [System.IO.Path]::GetFileName($scriptPath)


Write-Host "Script directory: $scriptDir"

# First, update group of IGLib Framework's extended repositories.
# This will also update IGLib basic and Framework extended repositories
# (scripts UpdateRepos_Basic.ps1 and )
& $(join-path $scriptDir "UpdateRepoGroup_Extended.ps1")


# Finally, update the ../workspacprojects/ container with submodules
& $(Join-Path $scriptDir "../../UpdateReposGroup_WorkspaceProjectsWithSubmodules.ps1")


Write-Host "  ... updating ALL IGLib Framework repositories complete.`n`n"

