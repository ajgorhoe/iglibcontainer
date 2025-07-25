
rem REMARK: 
rem This was used for development od new scripts, and it is not used any more.
rem Repository is only on GitLab and local, but NOT on GitHub.
rem Code generation in this repo may not work.
rem Repository and this script are kept just in case that we one would like
rem to look for something.


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
rem Reset the error level (by running an always successfull command):
ver > nul

rem Repository update parameters:
set ModuleDirRelative=codedoc_new_NotUsed
set CheckoutBranch=master
set RepositoryAddress=https://gitlab.com/ajgorhoe/iglib.workspace.codedoc_develop.git
set RepositoryAddressSecondary=
set RepositoryAddressLocal=d:/backup_sync/bk_code/git/ig/workspace/codedoc_new
set Remote=origin
set RemoteSecondary=
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


:finalize


endlocal

