
@echo off
rem This script updates a specific IGLib's module by cloning its Git 
rem repository (if necessary), and updating it to the current state.

rem Bootstrap scripting such that update scripts are available:
set BootStrapScripting=%~dp0%BootStrapScripting.bat
echo.
echo SCRIPT: BootStrapScripting: "%BootStrapScripting%"
echo.
if not exist "%BootStrapScripting%" (
  echo.
  echo ERROR: Variable BootStrapScripting does not contain a valid
  echo   script path.
  echo.
  goto finalize
)
call "%BootStrapScripting%"

rem Start local context, such that generation script does not have side effects:
setlocal
set StoredErrorLevel=0
rem Reset the error level (by running an always successfull command):
ver > nul
rem Basic directories & default parameter values:
set ScriptDir=%~dp0
set InitialDir=%CD%

rem Repository update parameters:
set ModuleDirRelative=applications
set CheckoutBranch=master
set RepositoryAddress=https://github.com/ajgorhoe/IGLib.workspace.applications.git
set RepositoryAddressSecondary=https://gitlab.com/ajgorhoe/iglib.workspace.applications.git
set RepositoryAddressLocal=d:/backup_sync/bk_code/git/ig/workspace/applications.git/
set Remote=origin
set RemoteSecondary=zz_origin_gitlab
set RemoteLocal=local

rem Derived parameters:
set ModuleDir=%~dp0%ModuleDirRelative%


echo.
echo SCRIPT: UpdateRepo: "%UpdateRepo%"
echo.
if not exist "%UpdateRepo%" (
  echo.
  echo ERROR: Variable UpdateRepo does not contain a valid script path.
  echo   BoorstrapScripting probably not performed correctly.
  echo.
  goto finalize
)

rem Finally, perform repository clone / update by using the scripts
rem prepared in the bootstrapping stage:
"%UpdateRepo%" %*



rem Updating code:
rem This code may be moved to a separate file in the future, in 
rem which case the update code would 


REM LEGACY code - to be deleted:
REM set ScriptLibraryDir=%ScriptDir%\scripts\
REM set UpdateModuleScript=%ScriptLibraryDir%UpdateModule.bat

REM if 0 NEQ 0 (
  REM rem Test output; this can also be excluded.
  REM echo.
  REM echo.
  REM echo In %0: Updating module %ModuleDirRelative%
  REM echo Calling: %UpdateModuleScript%
  REM echo Script dir: %ScriptDir%
  REM echo ...
REM )
REM if not exist %UpdateModuleScript% (
  REM echo.
  REM echo.
  REM echo ERROR: The module updating script does not exist:
  REM echo   %UpdateModuleScript%
  REM echo The operation cannot be performed.
  REM goto finalize
  REM echo.
  REM echo.
REM )
REM call %UpdateModuleScript% %*


:finalize

rem cd %InitialDir%


endlocal

