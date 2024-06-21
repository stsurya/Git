## Git Commands

**git init:** It'll intialize any empty git repository on your local with your branch name as `master`.

Note: Incase if your local got initialized with master branch and remote got intialized with main, use this command `git branch -m master main`. this command will move all your code from existing master branch to main branch.

**git add <filename>:** It'll add a file to your staging area.

### What is the use of staging area in Git ?

- To maintain clean, organized and meaningful commit history.
- If you don't want appear some files into your commit, but wants to be track them by git.

If you staged you files and want to unstage them again, use `git reset` command.

- **git commit -m <your_message>:** This is used to commit your staged files on to your local branch.

- If you want to commint only specific file which are staged you can do this `git commit file1 file2 -m <your_mssg>`
  ##adding comment

**git log or git log --oneline:** `git log` will give the list of all commits with more details, whereas `git log --oneline` will give you minimum details and which are required in oneline.