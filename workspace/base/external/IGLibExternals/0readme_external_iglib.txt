
This directory contains external IGLib depandencies that are synchronized 
directly from external repositories.


This directory contains external libraries referenced by IGLib as source code.
The libraries are synchronized directly from  repositories.

In forked repositories for maintianing IGLib dependencies properly, branches
and tags are defined to denote commits that are referenced by specific 
versions of IGLib. The following example shows example of such a branch and 
a tag with corresponding descriptions for Math.NET Numerics:
Tag in Math.NET Numerics:
IGLib/Tag_21_10_24_IGLib_1.9.1
This tag marks the library as referenced by IGLib 1.9.1. It points to commit 8cdd91d37f36cb4daecc7838898a08ef9c3aa1a4.
Corresponding branch:
IGLib/21_10_24_IGLib_1.9.1
This branch contains the library as referenced by IGLib 1.9.1. A tag with a similar name is also created. Beginning of this branch points to commit 8cdd91d37f36cb4daecc7838898a08ef9c3aa1a4.
* Remark: tag would in principle be sufficient, but branch also enables making
small modifications over time.


Repositories included or worked on:

mathnet-numerics
https://github.com/mathnet/mathnet-numerics.git
8cdd91d37f36cb4daecc7838898a08ef9c3aa1a4
https://github.com/ajgorhoe/mathnet-numerics.git

ZedGraph
https://github.com/ZedGraph/ZedGraph.git
f7160203e2c400020046c97f61a01f470edcb4ce
https://github.com/ajgorhoe/ZedGraph.git

ActiViz.NET
https://github.com/dearman/activizdotnet.git
??
https://github.com/ajgorhoe/activizdotnet.git

AForge.net
https://github.com/ajgorhoe/AForge.NET.git
??
https://github.com/ajgorhoe/AForge.NET.git

Accord.NET
https://github.com/accord-net/framework.git
?? - last (archived)?
https://github.com/ajgorhoe/framework.git


Remark:
Storing copies of these libraries outside the referencing repositories
enables easier sharing among repositories and separate updates during 
development. For example, such external libraries will be much more static
than the referencing libraries, therefore it is worth storing a referenced
copies that can be copied around locally (which is faster) when new loval 
copies of referencing repositories are needed (these will be updated from
repositories rather than copied locally.)


