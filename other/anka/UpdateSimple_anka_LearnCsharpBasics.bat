
@echo off
rem This script is for simple update of an embedded repository.

setlocal

rem Reset the error level (by running an always successfull command):
ver > nul
rem Base directories:
set ScriptDir=%~dp0
set InitialDir=%CD%

rem Parameters for the update:
set ModuleDirRelative=anka_LearnCsharpBasics
set RepositoryAddress=https://github.com/AnkitaMega/LearnCsharpBasics.git
set CheckoutBranch=master
set Remote=origin

rem Derived parameters:
set ModuleContainingDir=%ScriptDir%
set ModuleDir=%ModuleContainingDir%%ModuleDirRelative%
set ModuleGitSubdir=%ModuleDir%\.git

rem Defaults for eventually missing information:
set IsDefinedCheckoutBranch=0
if defined CheckoutBranch (
  if "%CheckoutBranch%" NEQ "" (
    set IsDefinedCheckoutBranch=1
  )
)
if %IsDefinedCheckoutBranch% EQU 0 (
  echo.
  echo CheckoutBranch set to default - master
  set CheckoutBranch=master
)
set IsDefinedRemote=0
if defined Remote (
  if "%Remote%" NEQ "" (
    set IsDefinedRemote=1
  )
)
if %IsDefinedRemote% EQU 0 (
  echo.
  echo Remote set to default - origin
  set Remote=origin
)

echo.
echo.
echo.
echo Update / clone of embedded repository:
echo   %RepositoryAddress%
echo   to directory: %ModuleDirRelative%
echo   "%ModuleDir%"
echo   branch: %CheckoutBranch%
echo   remote: %Remote%
echo.

rem Clone the reepo if one does not exist (remove its directory before):
if not exist "%ModuleGitSubdir%" (
  if exist "%ModuleDir%" (
    rem Remove eventually existing directory befoehand:
    echo.
    echo Removing the current directory - invalid repo...
    rd /s /q %"ModuleDir"%
    echo.
  )
  echo.
  echo Cloning Git repository...
  git clone "%RepositoryAddress%" "%ModuleDir%"
  echo   ... done.
  echo.
  ver > nul
)

if not exist "%ModuleGitSubdir%" (
  echo.
  echo ERROR: Could not clone the repository.
  echo.
  goto finalize
)

cd "%ModuleDir%"

echo.
echo setting remote %Remote% ...
rem git remote remove %Remote% 
git remote add %Remote% "%RepositoryAddress%"

REM echo.
REM echo Fetching from %Remote%...
REM git fetch %Remote%

echo.
echo Try to check out remote branch...
rem Checkout the remote branch (case when not yet checked out):
git checkout -b "%CheckoutBranch%" "remotes/%Remote%/%CheckoutBranch%" --

echo.
echo Switching to local branch...
rem Switch to local branch  (case when not yet checked out):
git switch "%CheckoutBranch%"

echo.
echo Pulling changes from %Remote%...
git pull %Remote%


:finalize


echo.
echo Update script completed for %ModuleDirRelative%/.
echo.
echo.
echo.

cd %InitialDir%
ver > nul

endlocal

