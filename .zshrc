export ZSH=$HOME/.oh-my-zsh

[[ $TMUX = "" ]] && export TERM="screen-256color"

# disable tmux auto title
export DISABLE_AUTO_TITLE=true

# disable Ctrl-D so not to close terminal by accident
setopt ignoreeof

# to be able to ctrl-s in vim!
stty -ixon

# export HISTSIZE=100000 SAVEHIST=100000

# https://htmlhive.com/fixing-your-terminal-unix-history-command/
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export SAVEHIST=100000
export HISTSIZE=100000                   # many commands in ongoing session memory
export HISTFILESIZE=100000               # many lines in .bash_history

# https://stackoverflow.com/questions/12247777/share-history-between-panes-windows
setopt inc_append_history # share history betweent tmux panes/windows

plugins=(bower brew git heroku node npm tmux tmuxinator emoji colored-man-pages docker docker-compose)

source $ZSH/oh-my-zsh.sh
source $HOME/.bin/tmuxinator.zsh
source $HOME/.shfiles/z.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
# source $HOME/.rvm/scripts/rvm

fpath=(/usr/local/share/zsh-completions $fpath)

# zsh docker plugin seems to run only with this command
# if insecure dirs warning comes up - run this -> compaudit | xargs chmod g-w
autoload -U compinit && compinit

export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH=/usr/local/bin:$HOME/bin:/usr/local/git/bin:/usr/local/heroku/bin:$HOME/.composer/vendor/bin:$PATH
# export PATH=/usr/local/bin:$HOME/bin:/usr/local/git/bin:$HOME/.rvm/bin:/usr/local/heroku/bin:$HOME/.composer/vendor/bin:$PATH

export MYVIMRC=$HOME/.vimrc
export MYNVIMRC=$HOME/.config/nvim/init.vim
export EDITOR='/usr/local/bin/nvim'
export VISUAL='/usr/local/bin/nvim'
export GIT_EDITOR='/usr/local/bin/nvim'
export MDV_THEME=579.6579
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!{.git,node_modules,coverage}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_COMPLETION_TRIGGER='``'
export FZF_COMPLETION_OPTS='+c -x'
# Note: If you use iTerm and alt-c is not working, set alt key's behavior to Esc+
command -v blsd > /dev/null && export FZF_ALT_C_COMMAND='blsd'
export FZF_DEFAULT_OPTS='--extended --cycle --reverse'
# function below is required to respect .agignore for completion
_fzf_compgen_path() {
  ag -g "" "$1"
}

export PORT=3000

export NODE_ENV=development
export NODE_BACKBONE_VERSION=v6.14.4
export NODE_PORTAL_VERSION=v12.16.1

DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome

function ggr() { grep "$1" ${@:2} -R . }
function mcd() { mkdir -p "$1" && cd "$1";  }
function cht() { curl cht.sh/$1 }

function gdd() {
  if [ "$3" = "vim" ]; then
    nvim $(git diff HEAD~$1 HEAD~$2 --name-only)
  elif [ "$3" = "tool" ]; then
    git difftool HEAD~$1 HEAD~$2 ${@:4}
  elif [ "$3" = "name" ]; then
    git diff HEAD~$1 HEAD~$2 --name-only
  else
    git diff HEAD~$1 HEAD~$2 ${@:3}
  fi
}

function t() {
  # Defaults to 3 levels deep, do more with `t 5` or `t 1`
  # pass additional args after
  local levels=${1:-3}; shift
  tree -I '.git|node_modules|bower_components|.DS_Store' --dirsfirst -L $levels -aC $@
}

# google autocomplete
function c() { curl -sS "https://www.google.com/complete/search?client=hp&hl=en&xhr=t&q=$1" | json_pp | sed -nE '/<\/?b>/{s```g;s`"|,|^ *``g;p}'; }

# pipe to h to highlight text in terminal
h() {

  _usage() {
    echo "usage: YOUR_COMMAND | h [-idn] args...
  -i : ignore case
  -d : disable regexp
  -n : invert colors"
  }

  local _OPTS

  # detect pipe or tty
  if test -t 0; then
    _usage
    return
  fi

  # manage flags
  while getopts ":idnQ" opt; do
      case $opt in
         i) _OPTS+=" -i " ;;
       d)  _OPTS+=" -Q " ;;
         n) n_flag=true ;;
         Q)  _OPTS+=" -Q " ;;
             # let's keep hidden compatibility with -Q for original ack users
         \?) _usage
        return ;;
      esac
  done

  shift $(($OPTIND - 1))

  # check maximum allowed input
  if (( ${#@} > 12)); then
    echo "Too many terms. h supports a maximum of 12 groups. Consider relying on regular expression supported patterns like \"word1\\|word2\""
    exit -1
  fi;

  # set zsh compatibility
  [[ -n $ZSH_VERSION ]] && setopt localoptions && setopt ksharrays && setopt ignorebraces

  local _i=0

  if [ -z $n_flag ]; then
    #inverted-colors-last scheme
    _COLORS=( "underline bold red" "underline bold green" "underline bold yellow"  "underline bold blue"  "underline bold magenta"  "underline bold cyan" "bold on_red" "bold on_green" "bold black on_yellow" "bold on_blue"  "bold on_cyan" "bold on_magenta"  )
  else
    #inverted-colors-first scheme
    _COLORS=( "bold on_red" "bold on_green" "bold black on_yellow" "bold on_blue" "bold on_magenta" "bold on_cyan" "bold black on_white"  "underline bold red" "underline bold green" "underline bold yellow"  "underline bold blue"  "underline bold magenta"  )
    fi

  # build the filtering command
  for keyword in "$@"
  do
    local _COMMAND=$_COMMAND"ack $_OPTS --noenv --flush --passthru --color --color-match=\"${_COLORS[$_i]}\" '$keyword' |"
      _i=$_i+1
  done
  #trim ending pipe
  _COMMAND=${_COMMAND%?}
  #echo "$_COMMAND"
  cat - | eval $_COMMAND
}

rgv() {
  nvim $(rg -l "$1" -g !"node_modules")
}

rgvi() {
  nvim $(rg -li "$1" -g !"node_modules")
}

# ctrl-z to go back to suspended Vim
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# edit line in vim with ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# work-around to fix bug in npm install, where it reports EMFILE or glob error
ulimit -n 2560

cdf() {
    target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
    if [ "$target" != "" ]; then
        cd "$target"; pwd
    else
        echo 'No Finder window found' >&2
    fi
}

# curl commands

weather() { curl wttr.in/"$@"; }
cheat() { curl cheat.sh/"$@"; }
crypto() { curl rate.sx }

# ---------------------------- OSX only ----------------------------- #

case `uname` in
  Darwin)
    export NOTES_DIR=$HOME/Dropbox/NOTES

    # export NODE_PATH=/usr/local/lib/node_modules
    # export NODE_PATH=$NODE_PATH:/usr/local/lib/jsctags

    export GOPATH=$HOME/go
    export PATH=$GOPATH/bin:$PATH
    export PATH=$PATH:/usr/local/opt/go/libexec/bin
    ;;
  Linux)
    # export NODE_PATH=/usr/lib/node_modules
    # export PATH=$HOME/local/bin:$HOME/.npm-packages/bin:$PATH
    export PATH=$HOME/local/bin:$PATH
    export LANG=en_US.UTF-8
    export SHEll=/usr/bin/zsh

    # Linuxbrew
    export PATH="$HOME/.linuxbrew/bin:$PATH"
    export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
    export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
    ;;
esac

# lunchy

LUNCHY_DIR=$(dirname `gem which lunchy`)/../extras
if [ -f $LUNCHY_DIR/lunchy-completion.zsh ]; then
  . $LUNCHY_DIR/lunchy-completion.zsh
fi

# npm global install without sudo

# NPM_PACKAGES="${HOME}/.npm-packages"

# PATH="$NPM_PACKAGES/bin:$PATH"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
# unset MANPATH # delete if you already modified MANPATH elsewhere in your config
# export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# bin for python2
export PATH="/usr/local/opt/python@2/libexec/bin:$PATH"

# ruby - bin path and settings
export PATH="/usr/local/lib/ruby/gems/2.5.0/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"

# add Cabal's bin directory to the executable search PATH if it exists
# if [ -d "$HOME/.cabal/bin" ] ; then
#     PATH="$HOME/.cabal/bin:$PATH"
# fi

# add Stack's bin directory to the executable search PATH if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# search and replace text in all files - TODO: make a function
# Non recursive, files in the current directory only:
# sed -i -- 's/foo/bar/g' *
# Recursive, regular files (including hidden ones) in current dir and all its subdirs:
# find . -type f -exec sed -i 's/foo/bar/g' {} +

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# load aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# Set Spaceship ZSH as a prompt
ZSH_THEME='spaceship'
autoload -U promptinit; promptinit
prompt spaceship
