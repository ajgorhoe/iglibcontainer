
# Clones or updates all repositories contained in this directory.
Write-Host "`n`nCloning / updating other learning repositories (incorporated) ...`n"

# Get the script directory such that relative paths can be resolved:
$scriptPath = $MyInvocation.MyCommand.Path
$scriptDir = Split-Path $scriptPath -Parent
$scriptFilename = [System.IO.Path]::GetFileName($scriptPath)

Write-Host "Script directory: $scriptDir"

Write-Host "`nUpdating anka_LearnCsharpBasics:"
& $(Join-Path $scriptDir "UpdateRepo_anka_LearnCsharpBasics.ps1")

Write-Host "`nUpdating learn_anka_igor:"
& $(Join-Path $scriptDir "UpdateRepo_learn_anka_igor.ps1")

Write-Host "`nUpdating anka_html_basics:"
& $(Join-Path $scriptDir "UpdateRepo_anka_html_basics.ps1")

Write-Host "  ... updating other learning repositoris in the current directory completed.`n`n"

