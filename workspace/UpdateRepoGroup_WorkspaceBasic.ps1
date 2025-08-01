
# Clones or updates the basic repositories in ws/workspace.

# Get the script directory such that relative paths can be resolved:
$scriptPath = $MyInvocation.MyCommand.Path
$scriptDir = Split-Path $scriptPath -Parent
$scriptFilename = [System.IO.Path]::GetFileName($scriptPath)

Write-Host "`nCloning/updating BASIC WORKSPACE repositories:`n"
Write-Host "Script directory: $scriptDir"

Write-Host "`nUpdating codedoc:"
& $(Join-Path $scriptDir "UpdateRepo_codedoc.ps1")

Write-Host "`nUpdating igcpp:"
& $(Join-Path $scriptDir "UpdateRepo_igcpp.ps1")

Write-Host "`nUpdating z_courses:"
& $(Join-Path $scriptDir "UpdateRepo_z_courses.ps1")

Write-Host "`nUpdating applications:"
& $(Join-Path $scriptDir "UpdateRepo_applications.ps1")

UpdateRepoGroup_WorkspaceProjects.ps1
Write-Host "  ... updating basic workspace repositories completed.`n`n"

