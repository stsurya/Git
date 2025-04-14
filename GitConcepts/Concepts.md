## Git Commands

**git init:** It'll intialize any empty git repository on your local with your branch name as `master`.

Note: Incase if your local got initialized with master branch and remote got intialized with main, use this command `git branch -m master main`. this command will move all your code from existing master branch to main branch.

**git add <filename>:** It'll add a file to your staging area.

### What is the use of staging area in Git ?

- To maintain clean, organized and meaningful commit history.
- If you don't want appear some files into your commit, but wants to be track them by git.

- If you staged you files and want to unstage them again, use `git reset` command.

**git commit -m <your_message>:** This is used to commit your staged files on to your local branch.

- If you want to commit only specific file which are staged you can do this `git commit file1 file2 -m <your_mssg>`.

- If you want to skip staging completely, Sometimes, when you make small changes, using the staging environment seems like a waste of time. It is possible to commit changes directly, skipping the staging environment.
- The -a option will automatically stage every changed, already tracked file. But this is onyl applicable if your file is getting already tracked otherwise you need to do git add <filename> first.
  `git commit -a -m <your_mssg>`.

**git log or git log --oneline:** `git log` will give the list of all commits with more details, whereas `git log --oneline` will give you minimum details and which are required in oneline.

**git branch <new_brnchname>:** This command will create a new branch.\
**git checkout <new_brnchname>:** This will switch to your new branch.\
**git checkout -b <new_brnch>:** This will create a new branch and switch to it automatically at the same time.\
**git branch -d <local_branch_name>:** This will delete your local branch but not in remote.\
**git push origin --delete <remote_branch_name>:** This will delete remote branch.

**git merge <feature_branch>:** First checkout to main branch and on main branch apply this command to merge your feature branch to main branch.

**git rebase <feature_branch>:** It'll foloow liner approach, It means where you pulled the feature branch there only it'll merge the commits. where as merge will always create on top of that.

**git revert:**
Purpose: To undo a specific commit by creating a new commit that reverses the changes of the specified commit.
Behavior: It does not alter the commit history. Instead, it appends a new commit that undoes the changes made by the target commit.
Usage: Safe to use in a shared/public repository as it preserves the commit history.

`git revert <CommitID>`

**git reset:**
Purpose: To move the current branch to a specific commit, effectively discarding commits that came after the specified commit.
Behavior: Alters the commit history by moving the HEAD to the specified commit. Depending on the mode (--soft, --mixed, --hard), it can also change the index and working directory.
Usage: Should be used with caution, especially in a shared/public repository, as it can rewrite commit history and potentially cause issues for others working on the same branch.

`git reset --hard <CommitID>`

--soft: Keeps changes staged.
--mixed: Keeps changes in the working directory (default behavior).
--hard: Discards all changes, resetting both the index and working directory to match the specified commit.

**git cherry-pick:** When you want to merge specific commit to another branch you can use cherry-pick.
Eg:

```
    a - b - c - d   Main
         \
           e - f - g Feature
```

```
git checkout main

git cherry-pick f
```

```
    a - b - c - d - f   Main
         \
           e - f - g Feature
```

**git squash:** This is useful when you want to combine multiple commits into one single commit and push to remote.
This will be helpful when you want to maintain a clean commit history.

```
git rebase -i HEAD~3

An editor will open replace the messgae pick with squash of whatever the commints you want to squash. save and exit then another editor will open then you can enter your own commit message.

```

**git ls-files:** This will list all the files in a repo.
**git ls-files | xargs wc -l:** This will tell total how many number of lines a repo consists.

**git stash:** This will stash your changes in your current working directory. If you want to work on somethign else then you can stash or chnages and while you're back you can re-apply them.

**git stash pop:** This will reapply all your changes.
**git stash pop stash@{2}:** You can choose which stash to re-apply by passing its identifier as the last argument.

## git subtree

If you've a scenario where you need to push your sub folder to another repository then you can use the concept of subtree.

```
git subtree add --prefix=<Folder Name> <URL of Repo> <branch name>
```

```
git add
git commit
```

```
git subtree push --prefix=<Folder Name> <URL of Repo> <branch name>
```

**Explanation:**

- When you did `git subtree add` it'll create a folder in your local so make sure it shouldn't match with other folder names.
- Now push the folders or files into this new folder which is created by `git subtree add` which you want to maintain in the other repo.
- Now do push your changes only the new folder will be psuhed to new second repo.

---

## ✅ **Most Common `git diff` Usages (Top 5)**

1. `git diff`  
   → Unstaged changes (working directory vs staging area)

2. `git diff --cached` or `--staged`  
   → Staged changes (staging area vs last commit)

3. `git diff <commit1> <commit2>`  
   → Differences between two commits

4. `git diff <branch1> <branch2>`  
   → Differences between two branches

5. `git diff <file>`  
   → Differences in a specific file

6. `git diff HEAD`  
   → Changes in **both staged and unstaged** files compared to the **latest commit**

7. `git diff origin/main`  
   → Compares your current branch with the **remote main branch**

---

## Summary Table

| Command                        | What it does               |
| ------------------------------ | -------------------------- |
| `git diff`                     | Unstaged changes           |
| `git diff --cached`            | Staged changes             |
| `git diff HEAD`                | All changes vs last commit |
| `git diff <branch1> <branch2>` | Compare branches           |
| `git diff <commit1> <commit2>` | Compare commits            |
| `git diff --name-only`         | Only file names            |
| `git diff --stat`              | Change summary             |
| `git diff --word-diff`         | Word-level changes         |
