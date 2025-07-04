
# Clones or updates the IGLib Framework EXTENDED repositories in iglibmodules.
Write-Host "`n`nCloning / updating EXTENDED IGLib Framework repositories in iglibmodules ...`n"

# Get the script directory such that relative paths can be resolved:
$scriptPath = $MyInvocation.MyCommand.Path
$scriptDir = Split-Path $scriptPath -Parent
$scriptFilename = [System.IO.Path]::GetFileName($scriptPath)

Write-Host "Script directory: $scriptDir"


# First, update group of IGLib Framework's basic repositories.
# This will also update IGLib basic repositories 
# (script UpdateRepos_Basic.ps1)
& $(join-path $scriptDir "UpdateRepoGroup_Basic.ps1")


Write-Host "`nUpdating extended IGLibFramework repositories:`n"

Write-Host "`nUpdating iglibapp:"
& $(Join-Path $scriptDir "UpdateRepo_iglibapp.ps1")

Write-Host "`nUpdating shelldev:"
& $(Join-Path $scriptDir "UpdateRepo_shelldev.ps1")

Write-Host "`nUpdating data:"
& $(Join-Path $scriptDir "UpdateRepo_igdata.ps1")

Write-Host "`nUpdating iglearn:"
& $(Join-Path $scriptDir "UpdateRepo_iglearn.ps1")

Write-Host "`nUpdating igsandbox:"
& $(Join-Path $scriptDir "UpdateRepo_igsandbox.ps1")

Write-Host "`nUpdating unittests:"
& $(Join-Path $scriptDir "UpdateRepo_unittests.ps1")

Write-Host "`nUpdating igtest:"
& $(Join-Path $scriptDir "UpdateRepo_igtest.ps1")


Write-Host "  ... updating extended IGLib Framework repositories complete.`n`n"

