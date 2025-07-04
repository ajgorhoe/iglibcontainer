
# Clones or updates the IGLib Framework ALL repositories in iglibmodules.
Write-Host "`n`nCloning / updating ALL IGLib Framework repositories in iglibmodules ...`n"

# Get the script directory such that relative paths can be resolved:
$scriptPath = $MyInvocation.MyCommand.Path
$scriptDir = Split-Path $scriptPath -Parent
$scriptFilename = [System.IO.Path]::GetFileName($scriptPath)

Write-Host "Script directory: $scriptDir"


# First, update group of IGLib Framework's extended repositories.
# This will also update IGLib basic and Framework extended repositories
# (scripts UpdateRepos_Basic.ps1 and )
& $(join-path $scriptDir "UpdateRepoGroup_Extended.ps1")


Write-Host "`nUpdating extended-all IGLibFramework repositories:`n"

Write-Host "`nUpdating workspaceprojects:"
& $(Join-Path $scriptDir "UpdateRepo_workspaceprojects.ps1")

# clone of workspaceproject_all (below) is not included (this is a very large project)
Write-Host "`nUpdating workspaceprojects_all:"
& $(Join-Path $scriptDir "UpdateRepo_workspaceprojects_all.ps1")



Write-Host "  ... updating all IGLib Framework repositories complete.`n`n"

