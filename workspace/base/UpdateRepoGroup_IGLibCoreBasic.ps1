
# Clones or updates the basic IGLib repositories in iglibmodules.
Write-Host "`n`nCloning / updating BASIC IGLib repositories in iglibmodules ...`n"

# Get the script directory such that relative paths can be resolved:
$scriptPath = $MyInvocation.MyCommand.Path
$scriptDir = Split-Path $scriptPath -Parent
$scriptFilename = [System.IO.Path]::GetFileName($scriptPath)

Write-Host "`nUpdating BASIC IGLib repositories:`n"

Write-Host "Script directory: $scriptDir"

Write-Host "`nUpdating IGLibCore:"
& $(Join-Path $scriptDir "./UpdateRepo_IGLibCore.ps1")

Write-Host "`nUpdating IGLibScripts:"
& $(Join-Path $scriptDir "./UpdateRepo_IGLibScripts.ps1")

Write-Host "`nUpdating IGLibScripting:"
& $(Join-Path $scriptDir "./UpdateRepo_IGLibScripting.ps1")

Write-Host "`nUpdating IGLibScriptingCs:"
& $(Join-Path $scriptDir "./UpdateRepo_IGLibScriptingCs.ps1")

Write-Host "`nUpdating IGLibGraphics3D:"
& $(Join-Path $scriptDir "./UpdateRepo_IGLibGraphics3D.ps1")

Write-Host "`nUpdating IGLibSandbox:"
& $(Join-Path $scriptDir "./UpdateRepo_IGLibSandbox.ps1")

Write-Host "`nUpdating IGLibApps:"
& $(Join-Path $scriptDir "./UpdateRepo_IGLibApps.ps1")

# Remarks:
# Updating IGLibEventAggregator moved to UpdateRepos_Extended.ps1
# Updating iglearn & embedded repos moved to UpdateReposLrn.ps1


# # Update learning repo as part of IGLibBasic:
# Write-Host "`nUpdating iglearn:"
# & $(Join-Path $scriptDir "./UpdateRepo_iglearn.ps1")
# Write-Host "`nUpdating iglearn's embedded repos:"
# & $(Join-Path $scriptDir "iglearn/UpdateRepoGroup_OtherRepos.ps1")

Write-Host "  ... updating basic repositoris in iglibmodules/ completed.`n`n"

