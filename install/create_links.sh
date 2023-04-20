#!/bin/sh

DOTFILES="$HOME/.dotfiles"
HOME_CONFIG="$HOME/.config"
DOT_CONFIG="$DOTFILES/config"

if [ ! -d "$DOTFILES" ]; then
echo ".dotfiles not found, please make sure this repo has been cloned in your home directory"
exit 
fi 

echo "this script is going to overwrite all your current config files. you cool with that? (y/n)"
read overwrite

if [ $overwrite = "y" ] 
then
	echo "alright then, deleting"
	rm -rf $HOME/.config
	rm -rf $HOME/.vimrc
	rm -rf $HOME/.gitconfig
	rm -rf $HOME/.zshrc
	rm -rf $HOME/.zshenv
else
	echo "alright, goodbye then"
	exit
fi

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
ln -s $DOTFILES/bin $HOME/.local/bin
# vscode
# firefox

echo "symlinked everything"

