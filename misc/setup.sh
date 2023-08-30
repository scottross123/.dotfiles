#!/bin/bash

# link config

link_config() {
	DOTFILES="/home/scott/.dotfiles"
	echo $DOTFILES
	
	if [ ! -d "$DOTFILES" ]; then
		echo ".dotfiles not found, please make sure this repo is in your home directory"
		exit 
	fi 

	echo "removing .vimrc, .config, and .config if they already exist"
	sudo rm -rf .config
	sudo rm -rf .vimrc
	sudo rm -rf .gitconfig
	sudo rm -rf .zshrc

	
	ln -s $DOTFILES/.config ~/.config
	echo "symlinked .config in /home"
	ln -s $DOTFILES/.vimrc ~/.vimrc
	echo "symlinked .vimrc in /home"
	ln -s $DOTFILES/.gitconfig ~/.gitconfig	
	echo "symlinked .gitconfig in /home"
}

install_software() {
	if [[ $1 == "debian" ]]; then
		PACKAGE_MANAGER="apt-get install" 
	elif [[ $1 == "macos" ]]; then
		PACKAGE_MAANGER="brew install"
	else 
		echo "that is not a valid option, right now this script only supports debian and macos"
	fi

	echo "updating packages"
	# update packages

	echo "installing software for $1..."
	sudo $PACKAGE_MANAGER zsh
	echo "installed zsh"
	sudo $PACKAGE_MANAGER neovim
	echo "installed neovim"
	sudo $PACKAGE_MANAGER kitty
	echo "installed  kitty"
	sudo $PACKAGE_MANAGER neofetch
	echo "installed neofetch"
	sudo $PACKAGE_MANAGER docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
	echo "installed docker"
	sudo $PACKAGE_MANAGER curl
	echo "installed curl"
	sudo $PACKAGE_MANAGER gnupg2
	echo "installed gnupg2"
	sudo curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | zsh
	echo "installed nvm  (maybe?)"
	nvm install node
	node --version
	sudo $PACKAGE_MANAGER openjdk-17-jdk
	sudo $PACKAGE_MANAGER openJDK-17-jre
	java -version
	echo "installed java 17"
	echo "done installing software"
}

zsh_setup() {
	cp ~/.dotfiles/.zprofile /home/scott/.zprofile
	sudo chsh -s /bin/zsh
	source home/.config/zsh/.zshrc
}

setup() {
	echo "are you installing on debian or macos?"
	read os
	echo $os

	#if [[ $os != "debian" && $os != "macos" ]]; then
		#echo "right now this script only supports debian linux and macos"
		#exit
	#fi

	link_config
	#install_software $os
	zsh_setup	
}

setup
