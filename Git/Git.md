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