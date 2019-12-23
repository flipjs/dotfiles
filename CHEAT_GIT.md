# Git Cheatsheet


### Cheatsheet

- How to abort `git commit --amend`
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



