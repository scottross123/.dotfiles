#!/bin/zsh

DOTFILES="$HOME/.dotfiles"
DOT_CONFIG="$DOTFILES/config/zsh"
HOME_CONFIG="$HOME/.config/zsh"

rm $HOME/.zprofile
rm $HOME/.zshenv
rm $HOME/.zshrc

#ln -s $DOT_CONFIG/zsh/zprofile $HOME/.zprofile
ln -s $DOTFILES/zshenv $HOME/.zshenv
#ln -s $DOT_CONFIG $HOME_CONFIG
mkdir -p $HOME_CONFIG
ln -s $DOT_CONFIG/zshrc $HOME_CONFIG/.zshrc
ln -s $DOT_CONFIG/functions $HOME_CONFIG/functions
ln -s $DOT_CONFIG/exports $HOME_CONFIG/exports
ln -s $DOT_CONFIG/aliases $HOME_CONFIG/aliases
ln -s $DOT_CONFIG/vim $HOME_CONFIG/vim
ln -s $DOT_CONFIG/prompt $HOME_CONFIG/prompt

source $HOME/.zprofile
source $HOME/.zshenv
zsh $ZDOTDIR/.zshrc

