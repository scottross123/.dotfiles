#!/bin/bash

DOTFILES="$HOME/.dotfiles"
INSTALL_DIR=$DOTFILES/install

#if [[ $os != "debian" && $os != "macos" ]]; then
	#echo "right now this script only supports debian linux and macos"
	#exit
#fi

sudo chmod +x $INSTALL_DIR/*.sh

source $INSTALL_DIR/create_links.sh
source $INSTALL_DIR/zsh.sh
