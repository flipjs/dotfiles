# My Cheatsheet

### Terminal

- `reset` or `stty sane` - fix terminal messy output
- `rg -li <text_to_search> | parallel -X --tty nvim` - search text and load matched files in Vim
- `cp -r !(filename1 | dirnameX | filename2) destination/` - recursive copy excluding files and directories

### Tmux shortcuts

- `Ctrl-A C` - new window
- `Ctrl-A number` - switch window by number
- `Ctrl-A V` - split vertical
- `Ctrl-A B` - split below
- `Ctrl-A [` - copy
- `Ctrl-A ]` - paste
- `Ctrl-A X` - close pane
- `Ctrl-A Z` - zoom in
- `Ctrl-A D` - detach current session

### Tmux commands

- `tmux new -s <session_name>` - creates a new tmux session named session_name
- `tmux attach -t <session_name>` - attaches to an existing tmux session named session_name
- `tmux switch -t <session_name>` - switches to an existing session named session_name
- `tmux list-sessions` - lists existing tmux sessions
- `tmux detach (Ctrl-A D)` - detach the currently attached session

### Copying text inside Tmux

- `LINUX` - shift+mousing, then right-click to copy text
- `OSX` - just select the text, it will be auto-copied to clipboard

### Terminal shortcuts

- `Ctrl-A` - Move cursor to the beginning of the line
- `Ctrl-E` - Move cursor to the end of the line
- `Ctrl-K` - Delete from cursor to the end of the line
- `Alt-F` - Move cursor one word forward
- `Alt-B` - Move cursor one word backward
- `Alt-D` - Delete next word
- `Alt-Delete` - Delete previous word
- `Ctrl-W` - Delete previous word

### Npm

- `nodemon --exec npm run test` - Watch npm test
