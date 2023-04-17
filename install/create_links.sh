#!/bin/sh

DOTFILES="$HOME/.dotfiles"
HOME_CONFIG="$HOME/.config"
DOT_CONFIG="$DOTFILES/config"

if [ ! -d "$DOTFILES" ]; then
echo ".dotfiles not found, please make sure this repo has been cloned in your home directory"
exit 
fi 

echo "removing config files if they already exist"
# todo maybe have a prompt or something
rm -rf $HOME/.config
rm -rf $HOME/.vimrc
rm -rf $HOME/.gitconfig
rm -rf $HOME/.zshrc
rm -rf $HOME/.zshenv

mkdir -p $HOME/.config
ln -s $DOTFILES/vimrc $HOME/.vimrc
echo "symlinked .vimrc in /home"
ln -s $DOTFILES/gitconfig $HOME/.gitconfig	
echo "symlinked .gitconfig in /home"
ln -s $DOT_CONFIG/kitty $HOME_CONFIG/kitty
echo "symlinked kitty in .config"
ln -s $DOT_CONFIG/neofetch $HOME_CONFIG/neofetch
echo "symlinked neofetch in .config"	
ln -s $DOT_CONFIG/nvim $HOME_CONFIG/nvim
echo "symlinked nvim in .config"	

echo "symlinked everything"

