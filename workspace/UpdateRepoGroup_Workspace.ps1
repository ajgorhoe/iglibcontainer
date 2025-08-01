
# Clones or updates the IGLib Frameworrk basic repositories in iglibmodules.
Write-Host "`n`nCloning / updating basic IGLib Framework repositories in iglibmodules ...`n"

# Get the script directory such that relative paths can be resolved:
$scriptPath = $MyInvocation.MyCommand.Path
$scriptDir = Split-Path $scriptPath -Parent
$scriptFilename = [System.IO.Path]::GetFileName($scriptPath)


# First, update group of IGLib basic repositories:
# & $(join-path $scriptDir "UpdateRepoGroup_Basic.ps1")


Write-Host "`nUpdating BASIC WORKSPACE repositories:`n"

Write-Host "Script directory: $scriptDir"

Write-Host "`nUpdating codedoc:"
& $(Join-Path $scriptDir "UpdateRepo_codedoc.ps1")

Write-Host "`nUpdating igcpp:"
& $(Join-Path $scriptDir "UpdateRepo_igcpp.ps1")

Write-Host "`nUpdating iglibexternal:"
& $(Join-Path $scriptDir "UpdateRepo_z_courses.ps1")

Write-Host "`nUpdating igsolutions:"
& $(Join-Path $scriptDir "UpdateRepo_applications.ps1")


Write-Host "  ... updating basic workspace repositories completed.`n`n"

