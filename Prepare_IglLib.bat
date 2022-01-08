


@echo off
rem This script clones/updates the basic IGLib's modules necessary to view
rem and build the libraries and some of the demo applications based on the
library.

setlocal

rem Check out / update basic IGLib modules...
call "%~dp0\workspace\base\UpdateDirectoryModules_Base.bat" %*

rem Check out / update internal modules and external dependencies...
call "%~dp0\workspace\base\iglib\\00_initmodules\UpdateIGLibModuleRepos.bat" %*

rem Check out code documentation directory with scripts etc.:
call "%~dp0\workspace\UpdateModule_codedoc.bat" %*

rem Check out basic example / demo data:
call "%~dp0\UpdateWorkspaceprojectsDirectory.bat" %*

endlocal

