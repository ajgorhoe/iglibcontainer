
@echo off

REM This script just passes execution to 
REM bootstrappingscripts/BootStrapScripting.bat

set RedirectScript=%~dp0\bootstrappingscripts\BootStrapScripting.bat

echo.
echo %~n0%~x0: redirecting the call to:
echo   %RedirectScript%
echo.
call "%RedirectScript%"


REM Legacy code, can be removed afer some time:



REM :: Prepares environment for execution of repository updating scripts.

REM echo.
REM echo BootStrapScripting.bat:
REM echo   bootstrapping essential scripts...
REM echo.
REM echo Obtaining bootstrapping script repository settins...

REM :: Define initially script locations for bootstrapping:
REM set BootstrapSettings=%~dp0\SettingsIGLibScriptsBootstrap.bat
REM set UpdateRepo=%~dp0\bootstrappingscripts\UpdateRepo.bat
REM set SetVar=%~dp0\bootstrappingscripts\SetVar.bat
REM set PrintRepoSettings=%~dp0\bootstrappingscripts\PrintRepoSettings.bat

REM REM if 1 NEQ 0 (
  REM REM echo.
  REM REM echo Initial script paths:
  REM REM echo BootstrapSettings: "%BootstrapSettings%"
  REM REM echo UpdateRepo: "%UpdateRepo%"
  REM REM echo SetVar: "%SetVar%"
  REM REM echo PrintRepoSettings: "%PrintRepoSettings%"
REM REM )

REM :: Obtain for IGLibScripting repository for bootstrapping:
REM :: call "%~dp0\SettingsIGLibScriptsBootstrap.bat"
REM call "%BootstrapSettings%"

REM :: Derived variable - already defined in settings::
REM set ModuleGitSubdir=%ModuleDir%\.git\refs

REM REM :: Print settings for bootstrapping IGLib repo:
REM REM call "%PrintRepoSettings%"

REM set BootstrapRepoUpdated=0
REM if exist "%ModuleGitSubdir%" goto :SkipUpdate
  REM :: The IGLibScripts for bootstrapping not yet properly cloned, 
  REM :: perform repo update (cloning):
  REM call "%UpdateRepo%" "%BootstrapSettings%"
  REM set BootstrapRepoUpdated=1
REM :SkipUpdate


REM if not exist "%ModuleGitSubdir%" goto ErrorScriptRepo
  REM rem Update script locations to point intto IGLibScripts
  REM rem by calling SetScriptReferences.bat in IGLibScripts:
  REM call "%ModuleDir%\SetScriptReferences.bat"
  REM rem call "%PrintScriptReferences%"
  REM goto AfterScriptReferencesUpdate
REM :ErrorScriptRepo
  REM echo.
  REM echo ERROR in BOOTSTRAPPING scripts:
  REM echo   IGLibScripts module could not be cloned.
  REM echo   Fallback to bootstrapping scripts; may not work properly.
  REM echo.
REM :AfterScriptReferencesUpdate



REM :finalize

REM echo.
REM echo   ... bootstrappping essential scripts completed.
REM echo.
