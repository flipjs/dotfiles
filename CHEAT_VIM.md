# Vim Cheatsheet

### Splits

- `:vertical resize 100` - resize split width to 100
- `:resize 20` - resize split height to 20

### Formatting

- `=G` - format/hierarchically indent block of code from cursor location to EOF
- `gg=G` - format/hierarchically indent the whole code
- `dvip` - delete all empty lines but one

### Mappings

- `:verbose map <shortcut>` - see mapping for shortcut

### Useful commands

- `:w !sudo tee %` - saving that needs root permission

### History

- `q:` - pop open command history window
- `q/` - pop open search history window

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

### Quick setup (on foreign terminals)

```
set nocompatible
set ts=2 sw=2 sts=2 et
set backspace=indent,eol,start
```

### Must read!

[Your problem with Vim is that you don't grok vi](https://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim/1220118#1220118)
