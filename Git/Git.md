# GIT Layout
## Branches
* `master`
* `development`
* `dev<#>/<description>`: These are the branches where I will do my main
development for this project.

## Bash Commands
### Commit
```bash
$ git commit -m “<explanation for commit>” #m is to leave a message

$ git commit -am “explanation for commit>” # -a stages and commits changes to 
 # all tracked files.
```

### How to remove a committed (tracked) file and add it to gitignore:
[Video Link](https://www.youtube.com/watch?v=bEMIjwDfG-U)
```bash
git rm --cached <filename> #This is for a specific file. E.g. michael.txt
git rm -r --cached <directory name> #This is to remove a folder.
```
Once I have performed one of the above commands I need to commit this change.
Then I need to add the file to the gitignore file with the following code
```bash
$ echo “<directory or file name>” >> .gitignore
```
--- 

## Merge

### Copying files from 1 branch to another branch
```bash
$ git checkout branch1 # ensure branch1 is active
$ git checkout branch2 file.py
```
  This will not change the branch. After executing this command `file.py` will
  now be part of branch1. If it was already in branch1 the code will be updated
  to the code that was contained in branch2.

---
## Git Diff on two files not in a repo
`git diff --no-index --word-diff old.txt new.txt` 
(--word-diff highlights changes by word, not just line, which is super helpful for long text).

 
From <https://stackoverflow.com/questions/16683121/git-diff-between-two-different-files>




---

# References
+ [Git bash & Github SSH](https://liyanxu.blog/2017/02/12/install-git-on-windows-and-set-up-ssh-keys/)