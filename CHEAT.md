# My Cheatsheet

### Terminal

- `reset` or `stty sane` - fix terminal messy output
- `cp -r !(filename1 | dirnameX | filename2) destination/` - recursive copy excluding files and directories
- `tar --exclude="./.git" --exclude="./node_modules" -cvzf /backup/filename.tar.gz .` - cd /to/dir/to/backup then run the command
- `mdv README.md` - markdown viewer in terminal (preferred)
- `markdown README.md | lynx -stdin` - alternative markdown viewer in terminal
- `open -a "Google Chrome" <path/to/file>` - open file in Google Chrome browser
- `xmllint --format <path/to/file>` - view xml file
- `tidy -xml <path/to/file>` - view xml file (alt)
- `iTerm fullscreen no gap` - go to Preferences - Advanced - Windows - Terminal Windows resize smoothly - set to Yes
- `^foo^bar` - run previous command but replacing (foo with bar)
- `man ascii` - show ascii table
- `curl ifconfig.me` - get machine's external ip address
- `Vim tips`
    - `rg -li <text_to_search> | parallel -X --tty nvim` - search text and open matched files in Vim
    - `rg -li <text_to_search> | xargs nvim` - search text and open matched files in Vim
    - `vim git 'diff --name-only'` - open modified files in vim
    - `cat file.txt | vim -` - pipe stdout to vim

### Tmux shortcuts

- `ctrl-a c` - new window
- `ctrl-a number` - switch window by number
- `ctrl-a v` - split vertical
- `ctrl-a b` - split below
- `ctrl-a [` - copy
- `ctrl-a ]` - paste
- `ctrl-a x` - close pane
- `ctrl-a z` - zoom in
- `ctrl-a d` - detach current session
- `ctrl-a D` - useful when tmux/pane freezes
- `ctrl-a '` - to select the window index
- `ctrl-a w` - to get an interactive index to choose from (0-9a-z)

### Tmux commands

- `tmux new -s <session_name>` - creates a new tmux session named session_name
- `tmux attach -t <session_name>` - attaches to an existing tmux session named session_name
- `tmux switch -t <session_name>` - switches to an existing session named session_name
- `tmux list-sessions` - shows tmux sessions
- `tmux list-windows` - shows current tmux windows (tip: layout can be copied and pasted to tmuxinator config as is)
- `tmux detach (ctrl-a d)` - detach the currently attached session
- `ctrl-a x` - kill pane
- `:break-pane -t :` - move pane to its own window
- `ctrl-a !` - same as above (move pane to its own window)
- `:join-pane -s !` - move last active pane/window to the current window

### Copying text inside Tmux

- `LINUX` - shift+mousing, then right-click to copy text
- `OSX` - just select the text, it will be auto-copied to clipboard

### Terminal shortcuts

- `ctrl-a` - move cursor to the beginning of the line
- `ctrl-e` - move cursor to the end of the line
- `ctrl-k` - delete from cursor to the end of the line
- `alt-f` - move cursor one word forward
- `alt-b` - move cursor one word backward
- `alt-d` - delete next word
- `alt-delete` - delete previous word
- `ctrl-w` - delete previous word
- `ctrl-x e` - invoke an editor to write a long and complex command
- `alt-. or esc-.` - place the argument of the most recent command and can cycle through
- `ctrl-u [...] ctrl-y` - type partial command, kill this command, check something, yank the command, resume typing

### Docker

- Getting `node-sass` error from a docker image? Try this:
    1. run `docker exec -it <container_id> bash`
    2. from inside, run `npm rebuild node-sass`

### Npm

- `nodemon --exec npm run test` - run npm test and watch

### Programming Tips

#### Transform logical expressions (DeMorgan's Law)

- not(a or b) === (not(a) and not(b))
- not(a and b) === (not(a) or not(b))

### Mac Peripherals

- If a bluetooth device stops working, try turning off bluetooth on both devices and turn it back on.
- If airpods is acting up, try putting it back inside the case (maybe it resets from there?)
