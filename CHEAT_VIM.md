# Vim Cheatsheet

### Splits

- `:vertical resize 100` - resize split width to 100
- `:resize 20` - resize split height to 20

### Formatting

- `=G` - format/hierarchically indent block of code from cursor location to EOF
- `gg=G` - format/hierarchically indent the whole code
- `dvip` - delete all empty lines but one
- `fix mixed tabs to space`
    - set tabstop=?? *visually adjust to correct spacing - this could be 2 for javascript*
    - set noexpandtab
    - :retab!
    - set expandtab
    - :retab!
- `:%!tail -r` - reverse all lines in the file
- `:'<,'>!tail -r` - reverse selected lines

### Mappings

- `:verbose map <shortcut>` - see mapping for shortcut

### Useful commands/shortcuts

- `gx` - opens link into browser when cursor is over the link
- `"qp` - paste the contents of register "q"
- `"qyy` - yank the line into register "q"
- `:<c-r><c-r>q` - paste the contents of register "q" to the command line
- `:w !sudo tee %` - saving that needs root permission
- `:echo @%` - show path of current buffer
- `:g/hello/d` - delete all lines containing "hello"
- `:v/hello/d` - delete all lines that do NOT contain "hello"
- `:sort u` - sort and remove duplicate lines
- `m in NerdTree` - open options to modify a node (add, move, delete a file...)
- `\C` - append \C to force matching case for the whole pattern
- `:cq!` - abort git commit
- `:s/\v<./\u&/g` - capitalize each word
- `gqq or gqip or gqap` - wrap long paragraph (see gq and textwidth)
- `g c-g` - count number of lines highlighted
- `%!awk '{print; total+=$1}END{print total}'` - sum up list of numbers

### History

- `q:` - pop open command history window
- `q/` - pop open search history window
- `:<c-f>` - edit command line in command history window
- `/<c-f>` - edit search in search history window
- `/<c-o> / <c-i>` - ctrl-o goes to the older position, and ctrl-i goes to the newer one

### Neovim Status

- `:CheckHealth` - run neovim healthchecks

### Have you tried these yet?

- `<c-x><c-l>`
- `<c-x><c-f>`
- `-17,-11t.`
- `+18,+22t.`
- `:argdo <command>`
- `:bufdo <command>`
- `edit!`
- `q: or :<c-f>`
- `q/ or /<c-f>`

### Quick setup (on foreign/remote terminals)

```
set nocompatible
set ts=2 sw=2 sts=2 et
set backspace=indent,eol,start
```

### Vim Tips and Links

[Vim Wikia](https://vim.fandom.com/wiki/Vim_Tips_Wiki)
[Arabesque](https://sanctum.geek.nz/arabesque/)
[Vim Tips and Tricks](https://www.cs.swarthmore.edu/help/vim/home.html)
[Your problem with Vim is that you don't grok vi](https://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim/1220118#1220118)
