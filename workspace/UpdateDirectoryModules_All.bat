
rem This scripts runs other scripts that include ALL IGLib-related and
rem other models included in any containing directory. This is done by
rem successivelly calling other scripts that update modules in specific
rem principa directories in the prescribed structure, such as workspace, workspaceprojects, workspace/base, etc.
rem Command-line arguments:
rem   %1: branch / tag name that is checked out (optional, default is master)

@echo off
rem Start local context, such that generation script does not have side effects:
setlocal
rem Reset the error level (by running an always successfull command):
ver > nul

set ScriptDir=%~dp0
set InitialDir=%CD%
set PrimaryInitializationScript=%ScriptDir%InitScriptDir.bat

echo.
echo.
echo.
echo Updating IGLib modules in ALL main directories:
echo   %ScriptDir%
echo.
echo.

if exist "%PrimaryInitializationScript%" (
 echo Calling primary initialization script:
 echo   call "%PrimaryInitializationScript%" %*
 call "%PrimaryInitializationScript%" %*
) else (
  echo WARNING: Primary initialization script does not exist:
  echo   "%PrimaryInitializationScript%"
  echo   The workspace/scripts/ module may not be initialized properly.
)


call %ScriptDir%\base\UpdateDirectoryModules_Base.bat %1
call %ScriptDir%\UpdateDirectoryModules_Workspace.bat %1
call %ScriptDir%\..\workspaceprojects\UpdateDirectoryModules_WorkspaceProjects.bat %1

:finalize

cd %InitialDir%
endlocal

