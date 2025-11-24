
# Clones or updates the EXTENDED IGLib repositories in iglibmodules/.
Write-Host "`n`nCloning / updating EXTENDED IGLib repositories in iglibmodules/ ..."

# Get the script directory such that relative paths can be resolved:
$scriptPath = $MyInvocation.MyCommand.Path
$scriptDir = Split-Path $scriptPath -Parent
$scriptFilename = [System.IO.Path]::GetFileName($scriptPath)

Write-Host "Script directory: $scriptDir"

# Write-Host "`n`nUpdating basic IGLib repositories:`n" # this output is already in script.
& $(join-path $scriptDir "UpdateRepoGroup_IGLibCoreBasic.ps1")

Write-Host "`nUpdating EXTENDED IGLib repositories...`n"

Write-Host "`nUpdating IGLibEventAggregator:"
& $(Join-Path $scriptDir "./UpdateRepo_IGLibEventAggregator.ps1")

Write-Host "`nUpdating HashForm:"
& $(Join-Path $scriptDir "./UpdateRepo_HashForm.ps1")

# Write-Host "`nUpdating IGLibScriptsPS:"
# & $(Join-Path $scriptDir "./UpdateRepo_IGLibScriptsPS.ps1")

# Write-Host "`nUpdating IGLibScriptsEXP:"
# & $(Join-Path $scriptDir "./UpdateRepo_IGLibScriptsEXP.ps1")


Write-Host "  ... updating EXTENDED repositoris in iglibmodules/ completed.`n`n"

