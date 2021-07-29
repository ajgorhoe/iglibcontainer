
@echo off

set IGLibScripts=%~dp0\modules\IGLibScripts

if not exist "%IGLibScripts%" (
  call "%~dp0\InitScriptDir.bat"
)

set SetVar=%IGLibScripts%\SetVar.bat

set UpdateRepo=%IGLibScripts%\UpdateRepo.bat

set PrintRepoSettings=%IGLibScripts%\PrintRepoSettings.bat


ver > nul

