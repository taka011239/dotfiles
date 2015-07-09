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

# load nvm
export NVM_DIR="$HOME/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

# Config GVM (golang)
if [ -s ~/.gvm/scripts/gvm ]; then
    source ~/.gvm/scripts/gvm
    source ~/.gvm/scripts/completion
fi

# add travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

export PATH=$PATH:~/go_appengine

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

compinit -u
bashcompinit
