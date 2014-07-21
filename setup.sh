#!/bin/bash
DOTFILES="$HOME"/dotfiles
cd "$HOME"

# set bash config files
ln -s "$DOTFILES"/.bashrc .bashrc
ln -s "$DOTFILES"/.bash_profile .bash_profile

# set tmux config file
ln -s "$DOTFILES"/.tmux.conf .tmux.conf

# set emacs config file
ln -s "$DOTFILES"/.emacs.d .emacs.d

# set vim config file
#ln -s "$DOTFILES"/.vim .vim

# set term config
#ln -s "$DOTFILES"/.tmux.conf .tmux.conf
#ln -s "$DOTFILES"/.screenrc .screenrc

# create private bin dir
mkdir "$HOME"/bin
