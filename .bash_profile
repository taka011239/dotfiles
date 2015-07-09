# .bashrcの読み込み
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi
