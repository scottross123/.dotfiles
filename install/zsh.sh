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
ln -s $DOT_CONFIG/zshrc $HOME_CONFIG/.zshrc
ln -s $DOT_CONFIG/functions.zsh $HOME_CONFIG/.zsh
ln -s $DOT_CONFIG/exports.zsh $HOME_CONFIG/exports.zsh
ln -s $DOT_CONFIG/aliases.zsh $HOME_CONFIG/aliases.zsh
ln -s $DOT_CONFIG/vim.zsh $HOME_CONFIG/vim.zsh
ln -s $DOT_CONFIG/prompt.zsh $HOME_CONFIG/prompt.zsh

source $HOME/.zprofile
source $HOME/.zshenv
zsh $ZDOTDIR/.zshrc

