
# Clones or updates all repositories contained in this directory.
Write-Host "`n`nCloning / updating other learning repositories (incorporated) ...`n"

# Get the script directory such that relative paths can be resolved:
$scriptPath = $MyInvocation.MyCommand.Path
$scriptDir = Split-Path $scriptPath -Parent
$scriptFilename = [System.IO.Path]::GetFileName($scriptPath)

Write-Host "Script directory: $scriptDir"

Write-Host "`nUpdating Anka's basic repositories:`n"
& $(Join-Path $scriptDir "UpdateRepoGroup_AnkasRepositoriesBasic.ps1")

Write-Host "`nUpdating Anka's additional repositories:`n"

Write-Host "`nUpdating iglibmodules_anka:"
& $(Join-Path $scriptDir "UpdateRepo_iglibmodules_anka.ps1")

Write-Host "`nUpdating anka_LearnCsharpBasics:"
& $(Join-Path $scriptDir "UpdateRepo_igor_LearnCsharpBasics.ps1")

Write-Host "  ... updating other learning repositoris in the current directory completed.`n`n"

