export ZSH=$HOME/.oh-my-zsh

TERM=xterm-256color

# disable Ctrl-D so not to close terminal by accident
setopt ignoreeof

# to be able to ctrl-s in vim!
stty -ixon

# or set to 'random' to see other themes
ZSH_THEME="robbyrussell"

export HISTSIZE=100000 SAVEHIST=100000

plugins=(bower brew git heroku node npm tmux tmuxinator)

source $ZSH/oh-my-zsh.sh
source ~/.bin/tmuxinator.zsh

# TODO
export PATH=/usr/local/bin:$HOME/bin:/usr/local/git/bin:$HOME/.rvm/bin:/usr/local/heroku/bin:$HOME/.composer/vendor/bin:$PATH

# TODO
export MYVIMRC=~/.vimrc
export EDITOR='/usr/local/bin/vim'
export VISUAL='/usr/local/bin/vim'
export GIT_EDITOR='/usr/local/bin/vim'

export PORT=3000

export NODE_ENV=development

DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome

alias dh='dirs -v'
alias ls='ls -GpFh'
alias ll='ls -lGpFh'
alias la='ls -aGpFh'
alias lla='ls -laGpFh'
alias lss='find -P .  -maxdepth 1 -type l -exec echo -n "{} -> " \; -exec readlink {} \;'
alias neo='nvim'
alias nv='nvim'
alias v='vim'
alias vv='vim'
alias vi='vim'
alias vn='vim -u NONE'
alias vin='vim'
alias vz='vim ~/.zshrc'
alias vzh='vim ~/.zshrc'
alias vrc='vim $HOME/.vimfiles/vimconfig/vimrc'
alias vt='vim ~/.tmux.conf'
alias tt='tmux'
alias ta='tmux attach'
alias td='tmux detach'
alias tls='tmux ls'
alias cls='clear'
alias live='live-server -p 3000'
alias www='http-server -p 3000'
alias webs='http-server -p 3000'
alias mgd='~/bin/mgd.sh'
alias vb='cd $HOME/.vimfiles/vimbundle'
alias vc='cd $HOME/.vimfiles/vimconfig'
alias vv='cd $HOME/.vimfiles/vimviews'
alias dev='cd $HOME/dev'
alias blog='cd $HOME/dev/flipjs.io'
alias ng='cd $HOME/dev/angular'
alias bb='cd $HOME/dev/backbone'
alias js='cd $HOME/dev/javascript'
alias typ='cd $HOME/dev/typescript'
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
alias rea='cd $HOME/dev/react'
alias vue='cd $HOME/dev/vue'
alias red='cd $HOME/dev/redux'
alias py='cd $HOME/dev/python'
alias dj='cd $HOME/dev/django'
alias aacc='cd $HOME/dev/projects/aacc'
alias pv='cd $HOME/dev/projects/aacc && vim'
alias dos='ssh philip@178.62.80.73'
alias stp="open '$HOME/Library/Application Support/Sublime Text 3/Packages'"
alias kar="cd '$HOME/Library/Application Support/Karabiner'"
alias db="cd '$HOME/Dropbox'"
alias zrel=". ~/.zshrc"
alias zep='cd $HOME/dev/zepko;pwd'
alias zz='cd $HOME/dev/zepko/zepkocom;pwd'
alias zw='cd $HOME/dev/zepko/zwds;pwd'
alias zg='cd $HOME/dev/zepko/zgtin;pwd'
alias vzep='cd $HOME/103/dev/zepko;pwd'
alias vzz='cd $HOME/103/dev/zepko/zepkocom;pwd'
alias vzw='cd $HOME/103/dev/zepko/zwds;pwd'
alias vzg='cd $HOME/103/dev/zepko/zgtin;pwd'
alias msh='mux start shell'
alias mzw='mux start zwds'
alias mzg='mux start zgtin'
alias mzz='mux start zepko'
alias nvma4='nvm alias default 4.2.2'
alias nvma5='nvm alias default 5.1'
alias win2unix="find . -type f | xargs perl -pi -e 's/\r\n|\n|\r/\n/g'"
alias gdlast2='git diff HEAD^ HEAD'
alias npmgi='npm install -g js-beautify jshint jscs standard standard-format eslint eslint-config-standard-react eslint-plugin-standard eslint-config-standard eslint-plugin-react babel-eslint gulp grunt-cli babel-cli yo tsd bower generator-ng-poly webpack webpack-dev-server'

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


# ---------------------------- OSX only ----------------------------- #

case `uname` in
  Darwin)
    alias seraph="diskutil mount `diskutil list | grep "SERAPH" | sed -n -e 's/^.* //p'`"
    alias sati="diskutil mount `diskutil list | grep "SATI" | sed -n -e 's/^.* //p'`"
    alias bane="diskutil mount `diskutil list | grep "BANE" | sed -n -e 's/^.* //p'`"

    export NOTES_DIR=$HOME/Dropbox/NOTES

    # export NODE_PATH=/usr/local/lib/node_modules
    # export NODE_PATH=$NODE_PATH:/usr/local/lib/jsctags

    export GOPATH=$HOME/go
    export PATH=$GOPATH/bin:$PATH
    export PATH=$PATH:/usr/local/opt/go/libexec/bin

    export DOCKER_CERT_PATH=/Users/philip/.boot2docker/certs/boot2docker-vm
    export DOCKER_TLS_VERIFY=1
    export DOCKER_HOST=tcp://192.168.59.103:2376
    ;;
  Linux)
    # export NODE_PATH=/usr/lib/node_modules
    export PATH=$HOME/local/bin:$HOME/.npm-packages/bin:$PATH
    export LANG=en_US.UTF-8
    ;;
esac

export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# npm global install without sudo

NPM_PACKAGES="${HOME}/.npm-packages"

PATH="$NPM_PACKAGES/bin:$PATH"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
