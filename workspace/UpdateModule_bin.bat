
@echo off
rem This script updates a specific IGLib's module by cloning its Git 
rem repository (if necessary), and updating it to the current state.


rem Start local context, such that generation script does not have side effects:
setlocal

rem Bootstrap scripting such that update scripts are available:
rem Important: bootstrapping must be called before settings, otherwise
rem it would overrite the essential repository settings.
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


rem Repository update parameters:
set ModuleDirRelative=bin
set CheckoutBranch=master
set RepositoryAddress=https://gitlab.com/ajgorhoe/iglib.workspace.bin.git
set RepositoryAddressSecondary=
set RepositoryAddressLocal=
set Remote=origin
set RemoteSecondary=
set RemoteLocal=


rem Derived parameters:
set ModuleDir=%~dp0%ModuleDirRelative%

REM echo.
REM echo BEFORE UPDATING:
REM echo BootStrapScripting: "%BootStrapScripting%"
REM echo PrintRepoSettings: "%PrintRepoSettings%"
REM call "%PrintRepoSettings%"
REM echo.
REM echo Now calling UpdateRepo:
REM echo   "%UpdateRepo%" %*
REM echo.


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


:finalize


endlocal

