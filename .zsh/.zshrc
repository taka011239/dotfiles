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


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# added by travis gem
[ -f /Users/t-tsuchida/.travis/travis.sh ] && source /Users/t-tsuchida/.travis/travis.sh

## Key Bindings
# bindkey -s "^J" "zsh"
bindkey "^P" history-beginning-search-backward
bindkey "^[r" redo

# load nvm
export NVM_DIR="$HOME/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

# Config GoLang
[[ -s "/Users/t-tsuchida/.gvm/scripts/gvm" ]] && source "/Users/t-tsuchida/.gvm/scripts/gvm"
export PATH=$PATH:$HOME/go_appengine
 
case "${OSTYPE}" in
# OSX
darwin*)
    [ -f ~/dotfiles/.zsh/.osx ] && . ~/dotfiles/.zsh/.osx
    ;;
# Linux
linux*)
    [ -f ~/dotfiles/.zsh/.linux ] && ~/dotfiles/.zsh/.linux
    ;;
esac

# Load Modules
## load completion
autoload -U compinit
compinit

## load colors
autoload colors
colors
