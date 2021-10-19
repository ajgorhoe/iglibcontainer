
This is a container for IGLib's prescribed directory structure and contains
means for checking out the submodules.

Two different approaches are supported:
* Check out via batch scripts on the following main branches:
  * master
  * nomerge/checkout_with_batch_files
* Module check out via Git Submodules on the following main branches:
  * nomerge/checkout_via_submodules

The master bransh should be preferably used for checking out via batch 
scripts, although the two branches would be synchronized from time to time
and currently serve the same purpose.


---------- Remarks on updating workspaceprojects/ directory:

This main directory is not included in the container repository, but must
be restored from its container repository by one of the scripts contained
in this directory.

There are two different contaier repositories from which you can restore
the workspaceprojects/ directory.

The first one is for working with the newer / active projects. With this 
container only the update scripts are cloned, and contained projects are 
all updated via scripts from the repository. For updating or cloning this 
version, call the following script:
  * UpdateWorkspaceprojectsDirectory.bat
This script also updates project subdirectories. If you don't want that and
want to run these internal updates manually (only when you want this), call:
  * UpdateModule_workspaceprojects_container.bat

The second repository works the same with newer / active projects, but it 
also includes directly a number of older / historical / archived projects,
which don't have their own repositories. These directories are downloaded 
cloned directly with the container repository while newer projects with their
own repositories are updated only via update scripts, similarly as with the
previous repo. In order to clone / update workspaceprojects/ with the older
projecs included, and also update the contained newer projects via the
contained scripts, call the following script:
  * UpdateWorkspaceprojectsDirectory_all_witharchivedprojects.bat
To do the same but without also updating the project directories that have 
their own repositories, call the following script instead:
  * UpdateModule_workspaceprojects_all.bat


