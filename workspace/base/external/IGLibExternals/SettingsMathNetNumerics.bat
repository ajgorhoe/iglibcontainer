
@echo off

rem Sets parameters for cloning or updating the ZedGraph repository.

rem Parameters are set as environment variables with agreed names.
rem These settings are used by scripts such as:
rem   UpdateRepo.bat,  PrintRepoSettings.bat, etc.

rem Runnng the script has side effect (variables are set in the calling 
rem context). In order to eliminate side effects, call the script inside
rem a setlocal/endlocal block.

rem If the script is called with command-line PARAMETERS, these are interpreted
rem as EMBEDDED COMMAND with eventual parameters, which is CALLED AFTER the
rem parameters for repository updates are set. In lthis way one can e.g. achieve
rem overriding certain parameters by calling SetVar (with the corresponding
rem parameters) and so overriding the values set at the beginning of this script.

rem see also documentation comments in UpdateRepo.bat.


rem Reset the error level (by running an always successfull command):
ver > nul

rem Parameters for the update:
set ModuleDirRelative=mathnet-numerics
set CheckoutBranch=8cdd91d37f36cb4daecc7838898a08ef9c3aa1a4
set RepositoryAddress=https://github.com/ajgorhoe/mathnet-numerics.git
set RepositoryAddressSecondary=https://github.com/mathnet/mathnet-numerics.git
set RepositoryAddressLocal=d:\git_external\mathnet-numerics.git
set Remote=origin
set RemoteSecondary=upstream
set RemoteLocal=local

set ModuleDir=%~dp0%ModuleDirRelative%


if "%~1" EQU "" goto AfterCommandCall
	:: If any command-line arguments were specified then assemble a 
	:: command-line from these arguments and execute it:

	:: Assemble command-line from the remaining arguments....
	set CommandLine6945="%~1"
	:loop
	shift
	if [%1]==[] goto afterloop
	set CommandLine6945=%CommandLine6945% "%~1"
	goto loop
	:afterloop

	:: Call the assembled command-line:
	call %CommandLine6945%
:AfterCommandCall


echo.
echo SETTINGS defined for updating %ModuleDirRelative% .
echo.
