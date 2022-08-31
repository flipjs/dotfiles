export ZSH=$HOME/.oh-my-zsh
export HOMEBREW_BIN="/opt/homebrew/bin"

export PATH=/usr/local/bin:/usr/local/sbin:$HOMEBREW_BIN:$PATH

[[ $TMUX = "" ]] && export TERM="screen-256color"

# disable tmux auto title
export DISABLE_AUTO_TITLE=true

# disable Ctrl-D so not to close terminal by accident
setopt ignoreeof

# to be able to ctrl-s in vim!
stty -ixon

# https://htmlhive.com/fixing-your-terminal-unix-history-command/
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTFILESIZE=1000000
export HISTSIZE=$HISTFILESIZE
export SAVEHIST=$HISTFILESIZE

export KEYTIMEOUT=1

# https://stackoverflow.com/questions/12247777/share-history-between-panes-windows
setopt inc_append_history # share history betweent tmux panes/windows

plugins=(bower brew git heroku node npm tmux tmuxinator emoji colored-man-pages docker docker-compose)

source $ZSH/oh-my-zsh.sh
source $HOME/.bin/tmuxinator.zsh
source $HOME/.shfiles/z.sh

[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
# source $HOME/.rvm/scripts/rvm

fpath=(/usr/local/share/zsh-completions $fpath)

# zsh docker plugin seems to run only with this command
# if insecure dirs warning comes up - run this -> compaudit | xargs chmod g-w
autoload -U compinit && compinit

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export MYVIMRC=$HOME/.vimrc
export MYNVIMRC=$HOME/.config/nvim/init.vim
export EDITOR='$HOMEBREW_BIN/nvim'
export VISUAL='$HOMEBREW_BIN/nvim'
export GIT_EDITOR='$HOMEBREW_BIN/nvim'
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

# export PORT=3000

# Below is causing issue with Gogo Portal unit tests due to different code path in development - not good!
# Commenting the line below for now
# export NODE_ENV=development
export NODE_OLD_VERSION=v6.17.1
export NODE_LATEST_VERSION=v14.5.0

DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome

function ggr() { grep "$1" ${@:2} -R . }
function mcd() { mkdir -p "$1" && cd "$1";  }
function cht() { curl cht.sh/$1 }

function gdd() {
  case "$3" in
    vim) nvim $(git diff HEAD~$1 HEAD~$2 --name-only) ;;
    vimr) vimr $(git diff HEAD~$1 HEAD~$2 --name-only) ;;
    tool) git difftool HEAD~$1 HEAD~$2 ${@:4} ;;
    name) git diff HEAD~$1 HEAD~$2 --name-only ;;
    *) git diff HEAD~$1 HEAD~$2 | delta -s ${@:3} ;;
  esac
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

topc() {
  history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n${1:-20}
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
# autoload edit-command-line; zle -N edit-command-line
# bindkey '^e' edit-command-line

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

    # export GOPATH=$HOME/go
    # export PATH=$GOPATH/bin:$PATH
    # export PATH=$PATH:/usr/local/opt/go/libexec/bin
    ;;
  Linux)
    # export NODE_PATH=/usr/lib/node_modules
    # export PATH=$HOME/local/bin:$HOME/.npm-packages/bin:$PATH
    # export PATH=$HOME/local/bin:$PATH
    export LANG=en_US.UTF-8
    export SHELL=/usr/bin/zsh

    # Linuxbrew
    export PATH="$HOME/.linuxbrew/bin:$PATH"
    export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
    export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
    ;;
esac

# npm global install without sudo

# NPM_PACKAGES="${HOME}/.npm-packages"

# PATH="$NPM_PACKAGES/bin:$PATH"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
# unset MANPATH # delete if you already modified MANPATH elsewhere in your config
# export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# bin for python2
# export PATH="/usr/local/opt/python@2/libexec/bin:$PATH"

# ruby - bin path and settings
export PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"

# python pip packages
export PATH="$HOME/Library/Python/3.9/bin:$PATH"

# /usr/local/sbin
# export PATH="/usr/local/sbin:$PATH"

# cargo/rust
# export PATH=$HOME/.cargo/bin:$PATH

# add Cabal's bin directory to the executable search PATH if it exists
# if [ -d "$HOME/.cabal/bin" ] ; then
#     PATH="$HOME/.cabal/bin:$PATH"
# fi

# add Stack's bin directory to the executable search PATH if it exists
# if [ -d "$HOME/.local/bin" ] ; then
#     PATH="$HOME/.local/bin:$PATH"
# fi

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

# load gogoenv
if [ -f ~/.gogoenv.sh ]; then
    . ~/.gogoenv.sh
fi

# https://github.com/zsh-users/zsh-syntax-highlighting
source /opt/homebrew/opt/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Set bat/cat theme
export BAT_THEME=ansi-dark
export QMK_HOME=$HOME/dev/mechanicalkeyboards/qmk_firmware

# Set less to search case-insensitive
export LESS=-iR

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

fpath=($fpath "/Users/felipe/.zfunctions")
fpath=($fpath "/Users/felipe/.zfunctions")
