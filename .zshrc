# set to show 256 colors
TERM=xterm-256color

# disable Ctrl-D so not to close terminal by accident
setopt ignoreeof

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# TO BE ABLE TO CTRL-S in VIM!
stty -ixon

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="agnoster"
ZSH_THEME="flipjs.io"
# DEFAULT_USER for agnoster theme only
# DEFAULT_USER="philip"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

export HISTSIZE=100000 SAVEHIST=100000

# My Notes directory
export NOTES_DIR=$HOME/Dropbox/NOTES

# AACC App settings
export FACEBOOK_ID=391524571029957
export FACEBOOK_SECRET=4a3eaf2f499658913ad0de32e311c68e

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(bower brew git heroku node npm zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=/usr/local/bin:$HOME/bin:/usr/local/git/bin:$HOME/.rvm/bin:/usr/local/heroku/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# Go configuration
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# DOCKER configuration
export DOCKER_CERT_PATH=/Users/philip/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376

export NODE_PATH=/usr/local/lib/node_modules
export NODE_PATH=$NODE_PATH:/usr/local/lib/jsctags

# vim
export MYVIMRC=~/.vimrc
export EDITOR='/usr/local/bin/vim'
export VISUAL='/usr/local/bin/vim'
export GIT_EDITOR='/usr/local/bin/vim'

export PORT=3000

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome

alias dh='dirs -v'
alias ls='ls -GpFh'
alias ll='ls -lGpFh'
alias la='ls -aGpFh'
alias lla='ls -laGpFh'
alias stp="open '$HOME/Library/Application Support/Sublime Text 3/Packages'"
alias neo='nvim'
alias nv='nvim'
alias v='vim'
alias vv='vim'
alias vi='vim'
alias vn='vim -u ~/.vimbare'
alias vm='mvim'
alias vz='vim ~/.zshrc'
alias vzh='vim ~/.zshrc'
alias vrc='vim ~/.vimrc'
alias vt='vim ~/.tmux.conf'
alias tt='tmux'
alias ta='tmux attach'
alias td='tmux detach'
alias cls='clear'
alias live='live-server -p 3000'
alias www='http-server -p 3000'
alias webs='http-server -p 3000'
alias mgd='~/bin/mgd.sh'
alias vb='cd $HOME/.dotfiles/.vim/bundle'
alias dev='cd $HOME/dev'
alias blog='cd $HOME/dev/flipjs.io'
alias ng='cd $HOME/dev/angular'
alias bb='cd $HOME/dev/backbone'
alias js='cd $HOME/dev/javascript'
alias cof='cd $HOME/dev/coffee'
alias me='cd $HOME/dev/mean'
alias dot='cd $HOME/.dotfiles'
alias proj='cd $HOME/dev/projects'
alias tmp='cd $HOME/dev/temp'
alias temp='cd $HOME/dev/temp'
alias kb='cd $HOME/dev/keyboard'
alias es='cd $HOME/dev/es6'
alias elix='cd $HOME/dev/elixir'
alias hsk='cd $HOME/dev/haskell'
alias zep='cd $HOME/dev/zepko'
alias react='cd $HOME/dev/react'
alias py='cd $HOME/dev/python'
alias dj='cd $HOME/dev/django'
alias aacc='cd $HOME/dev/projects/aacc'
alias pv='cd $HOME/dev/projects/aacc && vim'
alias dos='ssh philip@178.62.80.73'
alias win2unix="find . -type f | xargs perl -pi -e 's/\r\n|\n|\r/\n/g'"
alias kar="cd '$HOME/Library/Application Support/Karabiner'"
alias db="cd '$HOME/Dropbox'"
alias ec="cd '$HOME/.editorconfigs/ngpoly'"
alias snip="cd '$HOME/.vim/snippets'"
alias zrel=". ~/.zshrc"

alias seraph="diskutil mount `diskutil list | grep "SERAPH" | sed -n -e 's/^.* //p'`"
alias sati="diskutil mount `diskutil list | grep "SATI" | sed -n -e 's/^.* //p'`"
alias bane="diskutil mount `diskutil list | grep "BANE" | sed -n -e 's/^.* //p'`"
function ff() { find . -iname "*$1*" ${@:2} }
function ggr() { grep "$1" ${@:2} -R . }
function mcd() { mkdir -p "$1" && cd "$1";  }


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
		_COLORS=( "bold on_red" "bold on_green" "bold black on_yellow" "bold on_blue" "bold on_magenta" "bold on_cyan" "bold black on_white"  "underline bold red" "underline bold green" "underline bold yellow"  "underline bold blue"  "underline bold magenta" 	)
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

# CTRL-Z to go back to suspended Vim

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

# work around bug in npm install, reporting EMFILE or glob error
ulimit -n 2560
