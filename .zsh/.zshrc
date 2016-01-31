# Load Modules
## load completion
autoload -Uz compinit && compinit -u
autoload -U +X bashcompinit && bashcompinit

## load colors
autoload colors
colors

# Env Var
export LANG=ja_JP.UTF-8
export EDITOR=vim
PATH=/usr/local/bin:$PATH

# key binding
bindkey -e

# change directory
## options
setopt auto_cd
setopt auto_pushd

# history
## commons
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

## options
setopt histnostore
setopt histignoredups
setopt extendedhistory
setopt histreduceblanks
setopt histignorespace
setopt incappendhistory
setopt sharehistory

# show internal command manual
[ -n "`alias run-help`" ] && unalias run-help
autoload run-help

setopt correct

# disable option
unsetopt flowcontrol

PROMPT=" %{${fg[yellow]}%}%~%{${reset_color}%}
[%n]$ "
PROMPT2='[%n]> '

## Key Bindings
# bindkey -s "^J" "zsh"
bindkey "^P" history-beginning-search-backward
bindkey "^[r" redo

# Config rbenv
export RBENV_ROOT="$HOME/.rbenv"
if [ -d $RBENV_ROOT ]; then
    export PATH="$RBENV_ROOT/bin:$PATH"
    eval "$(rbenv init -)"
fi

# load nvm
export NVM_DIR="$HOME/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

# add travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

export GOENV_ROOT="$HOME/.goenv"
if [ -d $GOENV_ROOT ]; then
    export PATH="$GOENV_ROOT/bin:$PATH"
    eval "$(goenv init -)"
fi

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export PATH=~/go_appengine:$PATH

case "${OSTYPE}" in
# OSX
darwin*)
    [ -f ~/dotfiles/.zsh/.osx ] && . ~/dotfiles/.zsh/.osx
    ;;
# Linux
linux*)
    [ -f ~/dotfiles/.zsh/.linux ] && . ~/dotfiles/.zsh/.linux
    ;;
esac

[ -f ~/dotfiles/.zsh/.alias ] && . ~/dotfiles/.zsh/.alias

if [ -d ${HOME}/.anyenv ] ; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
    for D in `ls $HOME/.anyenv/envs`
    do
        export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
    done

fi

compinit -u
bashcompinit
