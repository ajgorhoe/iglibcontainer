
@echo off
rem This script updates a specific IGLib's module by cloning its Git 
rem repository (if necessary), and updating it to the current state.
rem Module-dependent parameters are hard coded butt can be overridden
rem by command-line parameters.
rem Script calls .../workspace/scripts/UpdateModule.bat to do the job
rem (that script can also be used for other modules not just IGLib).
rem The underlying general script (UpdateModule.bat) can take parameters
rem either via environment variables or command-line arguments (which have
rem priority over env. variables).
rem Command-line parameters:
rem   %1: RepositoryAddress - URL of module's git repository
rem   %2: ModuleDir - directory where module sgould be checked out.
rem       Specified as absolute or relative path, the directory must either
rem       already contain the cloned module (in which case the module is) 
rem       just updated to the latest state) or it must not exist (otherwise
rem       "git clone" would fail).
rem   %3: CheckoutBranch - branch to be checked out (optional).
rem See UpdateModule.bat for more precise specification.

rem Start local context, such that generation script does not have side effects:
setlocal
set StoredErrorLevel=0
rem Reset the error level (by running an always successfull command):
ver > nul
rem Basic directories & default parameter values:
set ScriptDir=%~dp0
set InitialDir=%CD%
set CheckoutBranch=""

rem Hardcoded parameters (Change with module, overridable via cmd. args.):
set RepositoryAddress=https://github.com/ajgorhoe/IGLib.workspace.z_courses.git
set ModuleDirRelative=z_courses
set CheckoutBranch=master
rem Non-overridable:
set ScriptLibraryDir=%ScriptDir%\scripts\

rem Derived parameters:
set ModuleContainingDir=%ScriptDir%
set ModuleDir=%ModuleContainingDir%%ModuleDirRelative%
set UpdateModuleScript=%ScriptLibraryDir%UpdateModule.bat

if 0 NEQ 0 (
  rem Test output; this can also be excluded.
  echo.
  echo.
  echo In %0: Updating module %ModuleDirRelative%
  echo Calling: %UpdateModuleScript%
  echo Script dir: %ScriptDir%
  echo ...
)
if not exist %UpdateModuleScript% (
  echo.
  echo.
  echo ERROR: The module updating script does not exist:
  echo   %UpdateModuleScript%
  echo The operation cannot be performed.
  goto finalize
  echo.
  echo.
)
call %UpdateModuleScript% %*
rem   %RepositoryAddress% "%ModuleDir%" %CheckoutBranch%

:finalize

cd %InitialDir%


endlocal

