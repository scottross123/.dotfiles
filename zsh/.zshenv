export DOTDIR=$HOME/.dotfiles
export ZDOTDIR=$HOME/.config/zsh
export EDITOR=vim

# for extra secret environment variables i don't want synced or in git
test -f $HOME/.env && source $HOME/.env

