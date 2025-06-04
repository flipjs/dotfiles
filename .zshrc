export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="spaceship"
source $HOME/.oh-my-zsh/custom/themes/spaceship.zsh-theme

export PATH=/usr/local/bin:/usr/local/sbin:$PATH

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

# Set HOMEBREW dir for Apple Silicon vs Intel
export NVM_DIR="$HOME/.nvm"
if [[ $(uname -m) == 'arm64' ]]; then
  export HOMEBREW_BIN="/opt/homebrew/bin"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
  # https://github.com/zsh-users/zsh-syntax-highlighting
  source /opt/homebrew/opt/zsh-syntax-highlighting/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  export PATH=$HOMEBREW_BIN:$PATH # not needed to set in else path as usr/local/bin is part of $PATH already
else
  export HOMEBREW_BIN="/usr/local/bin"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  # https://github.com/zsh-users/zsh-syntax-highlighting
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

export MYVIMRC=$HOME/.vimrc
export MYNVIMRC=$HOME/.config/nvim/init.vim
export EDITOR='$HOMEBREW_BIN/nvim'
export VISUAL='$HOMEBREW_BIN/nvim'
export GIT_EDITOR='$HOMEBREW_BIN/nvim'
export MDV_THEME=579.6579
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude '.git' --exclude 'node_modules'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d --hidden --follow --exclude '.git' --exclude 'node_modules'"
export FZF_COMPLETION_TRIGGER='``'
export FZF_COMPLETION_OPTS='+c -x'
export FZF_DEFAULT_OPTS='--extended --cycle --reverse'
# function below is required to respect .agignore for completion
_fzf_compgen_path() {
  ag -g "" "$1"
}

# export PORT=3000

# Below is causing issue with Gogo Portal unit tests due to different code path in development - not good!
# Commenting the line below for now
# export NODE_ENV=development

export NODE_OLD_VERSION=6
export NODE_LATEST_VERSION=20
export NODE_GGS_VERSION=10

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

function cdnode() {
  case "$1" in
    6) cd ~/.nvm/versions/node/v6.17.1/lib/node_modules ;;
    10) cd ~/.nvm/versions/node/v10.24.1/lib/node_modules ;;
    12) cd ~/.nvm/versions/node/v12.22.12/lib/node_modules ;;
    16) cd ~/.nvm/versions/node/v16.19.0/lib/node_modules ;;
    *) cd ~/.nvm/versions/node/v16.19.0/lib/node_modules ;;
  esac
}

function cdd() {
  cd $(fd -t d "$1" | fzf)
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
    ;;
  Linux)
    export LANG=en_US.UTF-8
    export SHELL=/opt/homebrew/bin/zsh

    # Linuxbrew
    export PATH="$HOME/.linuxbrew/bin:$PATH"
    export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
    export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
    ;;
esac

# bin for python2
export PATH="${HOME}/.pyenv/shims:${PATH}"

# ruby - bin path and settings
export PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"

# PHP 8.1
export PATH=/opt/homebrew/opt/php@8.1/bin:$PATH
export PATH=/opt/homebrew/opt/php@8.1/sbin:$PATH
export LDFLAGS="/opt/homebrew/opt/php@8.1/lib $LDFLAGS"
export CPPFLAGS="/opt/homebrew/opt/php@8.1/include $CPPFLAGS"

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# load aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# load gogoenv
if [ -f ~/.gogoenv.sh ]; then
    . ~/.gogoenv.sh
fi

# Set bat/cat theme
export BAT_THEME=ansi
export QMK_HOME=$HOME/dev/mechanicalkeyboards/qmk_firmware

# Set less to search case-insensitive
export LESS=-iR

fpath=($fpath "/Users/felipe/.zfunctions")
fpath=($fpath "/Users/felipe/.zfunctions")

cd ~/Documents/projects/portalui/portal

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
