# Git Cheatsheet


### Cheatsheet

- How to abort `git commit`
    - if inside vim, just do `:cq!`
- Rename a local and remote branch
    1. git branch -m new-name
    2. git push origin :old-name new-name
    3. git push origin -u new-name
- Delete a remote branch
    - git push origin --delete branch-name
- Delete remote-tracking branches no longer exist on the remote
    - git fetch origin --prune
- Search git commit messages
    - git log --oneline | grep PATTERN
- Start ignoring changes to a file
    - git update-index --assume-unchanged path/to/file
- Keep tracking files again
    - git update-index --no-assume-unchanged path/to/file
- Find commit that introduced a string
    - git log --all -p --reverse --source -S PATTERN
- How to exclude files only on your computer
    - add patterns in `.git/info/exclude` - same way in .gitignore
- Delete untracked files
    - git clean -f
- Reverting part of a commit
    - git revert -n $bad_commit    # Revert the commit, but don't commit the changes
    - git reset HEAD .             # Unstage the changes
    - git add --patch .            # Add whatever changes you want
    - git commit                   # Commit those changes

### Git branch prompt status
  - `?` — untracked changes;
  - `+` — uncommitted changes in the index;
  - `!` — unstaged changes;
  - `»` — renamed files;
  - `✘` — deleted files;
  - `$` — stashed changes;
  - `=` — unmerged changes;
  - `⇡` — ahead of remote branch;
  - `⇣` — behind of remote branch;
  - `⇕` — diverged changes.

### Branches
- hotfix  - hotfix/<HOTFIX> master
- feature - feature/<FEATURE>   develop
- bugfix  - bugfix/<BUGFIX> develop
- release - release/<RELEASE>   develop

### Conventional Commits
- feat     - A new feature;
- fix      - A bug fix
- docs     - Docume­ntation only changes
- style    - Changes that do not affect the meaning of the code
- refactor - Neither fixes a bug nor adds a feature
- perf     - Improves perfor­mance
- test     - Adding missing tests or correcting existing tests
- build    - Changes that affect the build system or external depend­encies
- ci       - Changes to our CI config­uration files and scripts
- chore    - Other changes that don't modify src or test files
- revert   - Reverts a previous commit
