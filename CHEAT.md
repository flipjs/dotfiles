# My Cheatsheet

### Search text and load files with matches to Vim

`rg -li <text_to_search> | parallel -X --tty nvim`

### Fix Terminal messy screen output

Either run: `reset` or `stty sane`

### Tmux shortcuts

- **Ctrl-A C** - new window
- **Ctrl-A number** - switch window by number
- **Ctrl-A V** - split vertical
- **Ctrl-A B** - split below
- **Ctrl-A [** - copy
- **Ctrl-A ]** - paste
- **Ctrl-A X** - close pane
- **Ctrl-A Z** - zoom in

### Copying text inside Tmux

- **LINUX**: shift+mousing, then right-click to copy text
- **OSX**: just select the text, it will be auto-copied to clipboard

### Terminal shortcuts

- **Ctrl-A**: Move cursor to the beginning of the line
- **Ctrl-E**: Move cursor to the end of the line
- **Ctrl-K**: Delete from cursor to the end of the line
- **Alt-F**: Move cursor one word forward
- **Alt-B**: Move cursor one word backward
- **Alt-D**: Delete next word
- **Alt-Delete**: Delete previous word
- **Ctrl-W**: Delete previous word

### Must read!

[Your problem with Vim is that you don't grok vi](https://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim/1220118#1220118)
