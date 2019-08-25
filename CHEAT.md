# My Cheatsheet

### Terminal

- `reset` or `stty sane` - fix terminal messy output
- `cp -r !(filename1 | dirnameX | filename2) destination/` - recursive copy
  excluding files and directories
- `tar --exclude="./.git" --exclude="./node_modules" -cvzf
  /backup/filename.tar.gz .` - cd /to/dir/to/backup then run the command
- `mdv README.md` - markdown viewer in terminal (preferred)
- `markdown README.md | lynx -stdin` - alternative markdown viewer in terminal
- `open -a "Google Chrome" <path/to/file>` - open file in Google Chrome browser
- `xmllint --format <path/to/file>` - view xml file
- `tidy -xml <path/to/file>` - view xml file (alt)
- `iTerm fullscreen no gap` - go to Preferences - Advanced - Windows - Terminal
  Windows resize smoothly - set to Yes
- `^foo^bar` - run previous command but replacing (foo with bar)
- `man ascii` - show ascii table
- `curl ifconfig.me` - get machine's external ip address
- `du -sh /path/to/dir` - show current directory's size
- `Vim tips`
    - `rg -li <text_to_search> | parallel -X --tty nvim` - search text and open
      matched files in Vim
    - `rg -li <text_to_search> | xargs nvim` - search text and open matched
      files in Vim
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
- `tmux attach -t <session_name>` - attaches to an existing tmux session named
  session_name
- `tmux switch -t <session_name>` - switches to an existing session named
  session_name
- `tmux list-sessions` - shows tmux sessions
- `tmux list-windows` - shows current tmux windows (tip: layout can be copied
  and pasted to tmuxinator config as is)
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
- `ctrl-x ctrl-e` - invoke an editor to write a long and complex command
- `alt-. or esc-.` - place the argument of the most recent command and can
  cycle through
- `ctrl-u [...] ctrl-y` - type partial command, kill this command, check
  something, yank the command, resume typing

### Zsh Z

- `z -r <term>` - match by rank only
- `z -t <term>` - match by recent access only
- `z -x` - remove the current directory from the datafile

### Docker

- Getting `node-sass` error from a docker image? Try this:
    1. run `docker exec -it <container_id> bash`
    2. from inside, run `npm rebuild node-sass`

### Git

- How to abort `git commit --amend`
    - if inside vim, just do `:cq!`
- Rename a local and remote branch
    1. git branch -m new-name
    2. git push origin :old-name new-name
    3. git push origin -u new-name
- Delete a remote branch
    - git push origin --delete branch-name
- Search git commit messages
    - git log --oneline | grep PATTERN

### Npm

- `nodemon --exec npm run test` - run npm test and watch
- `npm config prefix issue` - try this
    - `npm config delete prefix`
    - `npm config set prefix $NVM_DIR/versions/node/vX.XX.X`

### Brew

- `/usr/bin/find "$(brew --prefix)/Caskroom/"*'/.metadata' -type f -name '*.rb' -print0 | /usr/bin/xargs -0 /usr/bin/perl -i -pe 's/depends_on macos: \[.*?\]//gsm;s/depends_on macos: .*//g'` - fix for brew cask depends on macos value error

### Irssi

- `/ignore -channels #channel * JOINS PARTS QUITS NICKS` - unclutter screen
  with these messages

### Crypto

- `openssl genrsa -out private.pem 1024` - generate private key
- `openssl rsa -in private.pem -out public.pem -outform PEM -pubout` - generate
  public key (from a given private key)

### Programming Tips

#### Transform logical expressions (DeMorgan's Law)

- not(a or b) === (not(a) and not(b))
- not(a and b) === (not(a) or not(b))

### OSX

- `networksetup -setairportpower en0 off` - turn off wifi
- `networksetup -setairportpower en0 on` - turn on wifi
- `pmset -g ps` - see power source status
- if a bluetooth device stops working, try turning off bluetooth on both
  devices and turn it back on.
- if airpods is acting up, try putting it back inside the case (maybe it resets
  from there?)


### Working with Media Files

- `ffmpef -i input.mov -crf 23 output.mp4` - convert mov to mp4 (crf = 0, 18, 23, 28, 51 - lower value = better quality)

### Links

- [The Art of Command Line](https://github.com/jlevy/the-art-of-command-line)
- [Bash Hackers](https://wiki.bash-hackers.org/)
- [Git Bisect](https://increment.com/open-source/more-productive-git/#i-am-bisect-and-so-can-you)
- [Oh Shit Git!](https://ohshitgit.com/)
