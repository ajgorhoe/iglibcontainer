
@echo off
rem This script updates a specific IGLib's module by cloning its Git 
rem repository (if necessary), and updating it to the current state.

rem Bootstrap scripting such that update scripts are available:
set BootStrapScripting=%~dp0..\%BootStrapScripting.bat
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
set ModuleDirRelative=iglibapp
set CheckoutBranch=master
set RepositoryAddress=https://github.com/ajgorhoe/IGLib.workspace.base.iglibapp.git
set RepositoryAddressSecondary=https://ajgorhoe@bitbucket.org/ajgorhoe/iglib.workspace.base.iglibapp.git
set RepositoryAddressLocal=d:/backup_sync/bk_code/git/ig/workspace/base/iglibapp.git
set Remote=origin
set RemoteSecondary=zz_origin_bitbucket
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



echo #####################$$$$$$$$$$$$$$$$$$$$$$$$$

rem Finally, perform repository clone / update by using the scripts
rem prepared in the bootstrapping stage:
echo.
echo Executing: 
echo   call "%UpdateRepo%" %*
echo.
call "%UpdateRepo%" %*

echo #####################%%%%%%%%%%%%%%%%%%%%%%%%


rem WARNING:
rem Block below had to be commented out. Otherwise, we would get into an
rem infinite loop in some situations.
REM if 1 NEQ 0 (
  REM rem After restoring / updating the IGLib repository, we also need to
  REM rem restore / update its modulles and submodules. This is done by 
  REM rem calling the appropriate script in IGLib repo:
  REM echo.
  REM echo **************************************************************
  REM echo **************************************************************
  REM echo.
  REM echo Updating internal and external dependency modules of IGLib...
  REM echo Execuding:
  REM echo   call "%~dp0\iglib\UpdateGLibDependencies.bat"
  REM call call "%~dp0\iglib\UpdateGLibDependencies.bat"
  REM echo.
  REM echo  ... updating IGLib dependencies done.
  REM echo.
  REM echo **************************************
  REM echo **************************************
  REM echo.
REM )




:finalize


endlocal

