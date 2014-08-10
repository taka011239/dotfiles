# alias
case "${OSTYPE}" in
darwin*)
    alias ls='ls -G'
    alias ll='ls -lG'
    alias la='ls -laG';;
linux*)
    alias ls='ls --color'
    alias ll='ls -l --color'
    alias la='ls -la --color';;
esac

alias ocaml='ledit ocaml'
alias simplehttpd='python -m SimpleHTTPServer 8080'
alias docker_rm_all='docker rm $(docker ps -a -q)'
# alias docker_rmi_unused="docker rmi $(docker images -a | awk '/^<none>/{print $3}')"
alias docker_rmi_all='docker rmi &(docker images -a)'

# Add Android SDK's Path
export ANDROID_HOME=/Users/t-tsuchida/android-sdk-macosx
PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Config VIM
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

# Config Emacs
alias emacs='/usr/local/bin/emacs -nw'

# Use nvm for Node.js
export NVM_DIR="/Users/t-tsuchida/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm 

# Config pythonbrew
# [[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc

# Config GoLang
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin
export GOENVTARGET=$HOME/.goenvtarget
export GOENVGOROOT=$HOME/goenv
export GOENVHOME=$HOME/Documents/go_workspace
export PATH=$GOENVTARGET:$PATH
source $HOME/github/goenv/shellscripts/goenvwrapper.sh
export PATH=$PATH:$HOME/go_appengine

# Config rvm
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Initialization for FDK command line tools.Tue Sep 25 22:58:00 2012
#export FDK_EXE="/Users/t-tsuchida/bin/FDK/Tools/osx"
#export PATH=${PATH}:"/Users/t-tsuchida/bin/FDK/Tools/osx"

# OPAM configuration
. /Users/t-tsuchida/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
export OCAML_ANNOT=1

# Yesod
export PATH=$PATH:$HOME/Library/Haskell/bin

# Homebrew
export PATH=/usr/local/bin:/bin:/usr/bin:$PATH

# Homebrew API Token
if [ -f ~/.brew_api_token ];then
    source ~/.brew_api_token
fi

# Homebrew Cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications --caskroom=/usr/local/Caskroom"

# boot2docker
export DOCKER_HOST=tcp://localhost:2375


# added by travis gem
[ -f /Users/t-tsuchida/.travis/travis.sh ] && source /Users/t-tsuchida/.travis/travis.sh
