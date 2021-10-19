
rem This script restores / updates the workspaceprojects/ directory by 
rem that are all contained in a single repository that does not contain 
rem any projects by itself.
rem afterwards, the script also restores the projexts inside workspaceprojects/ 
rem that are contained in their own individual repositories.

rem If the other repository is currently checked out (with archive projects)
rem then remove the workspaceprojects/ first to create a clean clone later:
if exist "%~dp0\workspaceprojects\0readme_workspaceprojects_all.txt" (
  rd /s /q "%~dp0\workspaceprojects\"


call "%~dp0\UpdateModule_workspaceprojects_container.bat" 

call "%~dp0\workspaceprojects\UpdateDirectoryModules_WorkspaceProjects.bat"

