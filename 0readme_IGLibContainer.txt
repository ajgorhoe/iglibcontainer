
This is a container repository for IGLib's prescribed directory structure that 
contains individual projects included at the appropriate locations.

There are several branch for different mechanisms of checkouts:

* nomerge/checkout_with_batch_files - IGLib projects are checked out via
    batch scripts.
* nomerge/checkout_via_submodules - IGLIB projects are checked out via
  submodules.
* master branch contains combination of both. Care must be taken about 
    not overriding the dubmodule definitions when working on the masteer
	branch.
