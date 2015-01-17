# set to show 256 colors
TERM=xterm-256color

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="flipjs.io"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

export HISTSIZE=100000 SAVEHIST=100000

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

# vim
export MYVIMRC=~/.vimrc
export EDITOR='/usr/local/bin/vim'

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
alias stp="open '/Users/philip/Library/Application Support/Sublime Text 3/Packages'"
alias v='vim'
alias vv='vim'
alias vi='vim'
alias vz='vim ~/.zshrc'
alias vzh='vim ~/.zshrc'
alias vrc='vim ~/.vimrc'
alias ak='ack --smart-case'


function gtnode() {
cd $HOME/dev/node
}

function gtns() {
cd $HOME/dev/nodeschool
}

function gtblog() {
cd $HOME/dev/flipjs.io
}

function gtng() {
cd $HOME/dev/angular
}

function gtjs() {
cd $HOME/dev/javascript
}

function gtme() {
cd $HOME/dev/mean
}

function gtdot() {
cd $HOME/.dotfiles
}

function gtp() {
cd $HOME/dev/projects
}

function gtmp() {
cd $HOME/dev/tmp
}

function aacc() {
cd $HOME/dev/projects/aacc
}

function vp() {
cd $HOME/dev/projects/aacc
vim
}

function sshdo() {
ssh philip@178.62.80.73
}

function win2unix() {
  find . -type f | xargs perl -pi -e 's/\r\n|\n|\r/\n/g'
}



function ff() { find . -iname "*$1*" ${@:2} }
function ggr() { grep "$1" ${@:2} -R . }

function mcd() { mkdir -p "$1" && cd "$1";  }

# bindkey -M vicmd '?' history-incremental-search-backward
