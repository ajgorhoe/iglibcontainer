

========
How to change a bare repository to a normal one:
Execute:
  git config --unset core.bare
Then rename its directory to .git and move it to an empty directory. That 
directory becomes a non-bare repository with nothing checked out. Just checked
out a branch to populate the working directory.


======== 
How to push all branches from one remote to another remote

See: 
https://stackoverflow.com/questions/37884832/git-push-all-branches-from-one-remote-to-another-remote

One way is through intermediate bar / birror clone, see this answer: 
https://stackoverflow.com/a/54454345/3887591

There is a more direct way when you already have a local clone, see this (just use quoes around refs, as mentioned by Stefano):
This copies branches from origin to neworigin:
  git remote add neworigin url-to-new-remote
  git push neworigin --tags refs/remotes/origin/*:refs/heads/*


========
Several ways to mirror remote repository (i.e., copy all its remote branches
to local branches):
WARNING: doing this without consideration is not good, can lead to many stale 
branches that ere behind remote repositorz and this causes ptoblems if you doing
  git push --all
This can mazbe be done as temporary solution for szncing between several remotes.


-------- by defining an alias:
See this answer:  https://stackoverflow.com/a/16563327/3887591
Define an alias (command) by executing:

git config --global alias.clone-branches '! git branch -a | sed -n "/\/HEAD /d; /\/master$/d; /remotes/p;" | xargs -L1 git checkout -t'

Then use the alias like this:
  git clone-branches

- NE DELA, ukaz bi moral izvesti v unix shell-u (recimo poženeš bash), ampak tam ni povezave z inštalacijo Git-a na Windows.

-------- via clone bare or clone mirror:
From  https://stackoverflow.com/a/13575102/3887591 :
By creating a new clone (see this answer: ) 

mkdir repo
cd repo
git clone --bare path/to/repo.git .git
git config --unset core.bare
git reset --hard

Use --mirror instead of --bare if your remote repo has remotes of its own
This is a similar but more detailed answer:
https://stackoverflow.com/a/34122093/3887591 






