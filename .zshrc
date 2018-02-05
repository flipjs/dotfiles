export ZSH=$HOME/.oh-my-zsh

[[ $TMUX = "" ]] && export TERM="screen-256color"

# disable tmux auto title
export DISABLE_AUTO_TITLE=true

# disable Ctrl-D so not to close terminal by accident
setopt ignoreeof

# to be able to ctrl-s in vim!
stty -ixon

export HISTSIZE=100000 SAVEHIST=100000

plugins=(bower brew git heroku node npm tmux tmuxinator emoji)

source $ZSH/oh-my-zsh.sh
source ~/.bin/tmuxinator.zsh
source ~/.shfiles/z.sh
source ~/.oh-my-zsh/extensions/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $HOME/.rvm/scripts/rvm

# NOTE: oh-my-zsh overrides the prompt so Pure must be activated after source $ZSH/oh-my-zsh.sh
# ZSH Prompt by Sindre Sorhus
autoload -U promptinit; promptinit
# PURE_PROMPT_SYMBOL=λ
prompt pure

export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH=/usr/local/bin:$HOME/bin:/usr/local/git/bin:$HOME/.rvm/bin:/usr/local/heroku/bin:$HOME/.composer/vendor/bin:$PATH

export MYVIMRC=~/.vimrc
export MYNVIMRC=~/.config/nvim/init.vim
export EDITOR='/usr/local/bin/nvim'
export VISUAL='/usr/local/bin/nvim'
export GIT_EDITOR='/usr/local/bin/nvim'
export MDV_THEME=579.6579
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!{.git,node_modules,coverage}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_COMPLETION_TRIGGER='``'
export FZF_COMPLETION_OPTS='+c -x'
command -v blsd > /dev/null && export FZF_ALT_C_COMMAND='blsd'
export FZF_DEFAULT_OPTS='--extended --cycle --reverse'
# function below is required to respect .agignore for completion
_fzf_compgen_path() {
  ag -g "" "$1"
}

export PORT=3000

export NODE_ENV=development

DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome

alias vim='nvim'

# override oh-my-zsh glog
alias glog='git log --oneline --decorate --color --graph | less'

alias tree4='tree -L 4 -d'
alias tree3='tree -L 3 -d'
alias tree2='tree -L 2 -d'
alias tree1='tree -L 1 -d'
alias noder='node $HOME/.dotfiles/js/repl.js'
alias lol='archey -o && node -v | cowsay -f dragon-and-cow | lolcat'
alias cheat='mdv $HOME/.dotfiles/CHEAT.md'
alias vch='vim $HOME/.dotfiles/CHEAT.md'
alias cheatvim='mdv $HOME/.dotfiles/CHEAT_VIM.md'
alias vcv='vim $HOME/.dotfiles/CHEAT_VIM.md'
alias cheatoh='mdv $HOME/.dotfiles/CHEAT_OHMYZSH.md'
alias cheatg='cheatoh | rg git'
alias cheatpn='mdv $HOME/.dotfiles/CHEAT_PLUMNANO75.md'
alias cheatfu='mdv $HOME/dev/csp/fu-cheats/README.md'
alias vcfu='vim $HOME/dev/csp/fu-cheats/README.md'
alias figdata='figlet harmony data service && node -v | cowsay -f dragon-and-cow | lolcat'
alias figphone='figlet phone panel && node -v | cowsay -f dragon-and-cow | lolcat'
alias figlocal='figlet local dev && node -v | cowsay -f dragon-and-cow | lolcat'
alias figcontact='figlet manage contacts && node -v | cowsay -f dragon-and-cow | lolcat'
alias pret='prettier'
alias jj='z'
alias wh='which'
alias xo='xdg-open'
alias xx='exit'
alias xxx='exit'
alias xxxx='exit'
alias dh='dirs -v'
alias ls='ls -GpFh'
alias ll='ls -lGpFh'
alias la='ls -aGpFh'
alias lc='ls | wc -l'
alias lla='ls -laGpFh'
alias lsd='ls -d */'
alias lss='find -P .  -maxdepth 1 -type l -exec echo -n "{} -> " \; -exec readlink {} \;'
alias delnode='find . -name node_modules -type d -print0|xargs -0 rm -r --'
alias rmnode="find . -name node_modules -type d -prune -exec rm -rf '{}' +"
alias neo='nvim'
alias nv='nvim'
alias n='nvim'
alias v='vim'
alias vv='vim'
alias vi='vim'
alias Vim='vim'
alias vn='vim -u NONE'
alias vin='vim'
alias bim='vim'
alias vh='vim ~/.hyper.js'
alias vz='vim ~/.zshrc'
alias vzh='vim ~/.zshrc'
alias vrc='vim $HOME/.vimfiles/vimconfig/vimrc'
alias vnc='nvim $HOME/.config/nvim/init.vim'
alias vt='vim ~/.tmux.conf'
alias ta='tmux attach'
alias td='tmux detach'
alias tls='tmux ls'
alias tlsw='tmux list-windows'
alias tkill='tmux kill-session'
alias cls='clear'
alias arc='archey -o'
alias lara='php artisan serve --port=3000'
alias live='live-server -p 3000'
alias www='http-server -p 3000'
alias webs='http-server -p 3000'
# alias mgd='~/bin/mgd.sh'
alias mgd='mongod --dbpath $HOME/opt/data/db'
alias plugged='cd $HOME/.local/share/nvim/plugged'
alias vb='cd $HOME/.vimfiles/vimbundle'
alias vc='cd $HOME/.vimfiles/vimconfig'
alias vv='cd $HOME/.vimfiles/vimviews'
alias nc='cd $HOME/.config/nvim'
alias dev='cd $HOME/dev'
alias csp='cd $HOME/dev/csp'
alias exphds='export APP_DATA_SERVICE_URL=http://localhost:3000/csp__harmony-data--service'
alias scrum='cd $HOME/dev/scrum'
alias standup='nvim $HOME/dev/scrum/README.md'
alias cppa='cd $HOME/dev/csp/csp__phone-panel--app'
alias chld='cd $HOME/dev/csp/harmony__local-development'
alias cmc='cd $HOME/dev/csp/csp__manage-contacts--app'
alias ccl='cd $HOME/dev/csp/csp__zendesk-cleanup--service'
alias cql='cd $HOME/dev/csp/csp__harmony-data--service'
alias c360='cd $HOME/dev/csp/fu360'
alias czat='cd $HOME/dev/csp/zendesk-app-template'
alias oss='cd $HOME/dev/oss'
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
alias phoe='cd $HOME/dev/phoenix'
alias elix='cd $HOME/dev/elixir'
alias elmm='cd $HOME/dev/elm'
alias hsk='cd $HOME/dev/haskell'
alias rea='cd $HOME/dev/react'
alias vue='cd $HOME/dev/vue'
alias red='cd $HOME/dev/redux'
alias rb='cd $HOME/dev/ruby'
alias py='cd $HOME/dev/python'
alias ph='cd $HOME/dev/php'
alias dj='cd $HOME/dev/django'
alias aacc='cd $HOME/dev/projects/aacc'
alias pv='cd $HOME/dev/projects/aacc && vim'
alias dos='ssh philip@178.62.80.73'
alias stp="open '$HOME/Library/Application Support/Sublime Text 3/Packages'"
alias kar="cd '$HOME/.config/karabiner'"
alias db="cd '$HOME/Dropbox'"
alias zrel=". ~/.zshrc"
alias tt='tmuxinator start dev'
alias ttkill='tmux kill-session -t matrix'
alias msh='tmuxinator start shell'
alias mfh='tmuxinator start harmony'
alias mfc='tmuxinator start csp'
alias mfppa='tmuxinator start ppa'
alias mfhld='tmuxinator start hld'
alias mfmc='tmuxinator start contacts'
alias mfcl='tmuxinator start cleanup'
alias mfql='tmuxinator start ql'
alias mf360='tmuxinator start 360'
alias mfm='tmuxinator start mac'
alias mnt84='sudo sshfs -o allow_other root@10.10.10.84:/ $HOME/mount/84'
alias mnt242='sudo sshfs -o allow_other root@10.10.10.242:/ $HOME/mount/242'
alias umnt84='sudo umount $HOME/mount/84'
alias umnt242='sudo umount $HOME/mount/242'
alias cdmnt84='cd $HOME/mount/84'
alias cdmnt242='cd $HOME/mount/242'
alias cdmnt84zg='cd $HOME/mount/84/var/www/html/zgtin'
alias cdmnt242i3='cd $HOME/mount/242/root/I3'
alias nrb='npm run build'
alias nrc='npm run clean'
alias nry='npm run deploy'
alias nrp='npm run deploy:prod'
alias nrd='npm run dev'
alias nrl='npm run lint'
alias nrld='npm run lint:dev'
alias nrt='npm run test'
alias nrtp='npm run test::print'
alias nrtw='npm run test::watch'
alias wnrt='nodemon --exec "npm run test"'
alias nrtu='npm run test::unit'
alias nrtuw='npm run test::unit::watch'
alias wnrtu='nodemon --exec "npm run test::unit"'
alias nrti='npm run test::integration'
alias nrtiw='npm run test::integration::watch'
alias wnrti='nodemon --exec "npm run test::integration"'
alias nrtd='npm run test:dev'
alias wnrtd='nodemon --exec "npm run test::dev"'
alias nrs='npm start'
alias yrs='yarn start'
alias nrw='npm run watch'
alias nrsd='npm run start::dev'
alias nrsds='npm run start::devserver'
alias nrqa='npm run qa'
alias nrqal='npm run qa::lint'
alias nrqalf='npm run qa::lint::fix'
alias nrqalp='npm run qa::lint::print'
alias nrqaw='npm run qa::watch'
alias nrqalw='npm run qa::lint::watch'
alias nrwa='npm run watch::amd'
alias cras='NODE_PATH=./src npm start'
alias crab='NODE_PATH=./src npm run build'
alias crat='NODE_PATH=./src npm run test'
alias esl='eslint . ./'
alias win2unix="find . -type f | xargs perl -pi -e 's/\r\n|\n|\r/\n/g'"
alias nets='sudo netstat -ap'
alias dps='docker ps'
alias dsa='docker stop $(docker ps -a -q)'
# override gs (ghostscript) an run gst instead
alias gs='gst'
alias gls='git ls-files --others --exclude-standard'
alias gmodvim='git ls-files --modified | xargs nvim'
alias gdlast2='git diff HEAD^ HEAD'
alias gdfix='git diff --name-only | uniq | xargs nvim'
alias gitmergemaster='gcm && git fetch upstream && git merge upstream/master && gp'
alias nvma='nvm alias default node'
alias ic='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'
alias npmgi='npm install -g js-beautify jshint jscs standard standard-format eslint eslint-config-standard-react eslint-plugin-standard eslint-config-standard eslint-plugin-react babel-eslint gulp grunt-cli babel-cli yo tsd bower generator-ng-poly webpack webpack-dev-server'

function ff() { find . -iname "*$1*" ${@:2} }
function ggr() { grep "$1" ${@:2} -R . }
function mcd() { mkdir -p "$1" && cd "$1";  }

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
  rg -l "$1" -g !"node_modules" | xargs nvim
}

rgvi() {
  rg -li "$1" -g !"node_modules" | xargs nvim
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
    ;;
  Linux)
    # export NODE_PATH=/usr/lib/node_modules
    export PATH=$HOME/local/bin:$HOME/.npm-packages/bin:$PATH
    export LANG=en_US.UTF-8
    export SHEll=/usr/bin/zsh

    # Linuxbrew
    export PATH="$HOME/.linuxbrew/bin:$PATH"
    export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
    export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
    ;;
esac

# npm global install without sudo

NPM_PACKAGES="${HOME}/.npm-packages"

PATH="$NPM_PACKAGES/bin:$PATH"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# search and replace text in all files - TODO: make a function
# Non recursive, files in the current directory only:
# sed -i -- 's/foo/bar/g' *
# Recursive, regular files (including hidden ones) in current dir and all its subdirs:
# find . -type f -exec sed -i 's/foo/bar/g' {} +

eval $(thefuck --alias)
