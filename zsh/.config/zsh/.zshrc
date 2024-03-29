#!/usr/bin/zsh

# set opts
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

#auto complete
zstyle ':completion:*' menu select
zmodload zsh/complist
autoload -Uz compinit
compinit
_comp_options+=(globdots)

for file in $ZDOTDIR/functions/*; do
	source $file;
done

# add files to source
add_file "exports"
add_file "vim"
add_file "aliases"
add_file "prompt"

# plugins
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "agkozak/zsh-z"

zstyle ':completion:*' menu select

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# key bindings
# bindkey "^p" up-line-or-beginning-search # Up
# bindkey "^n" down-line-or-beginning-search # Down

# vscode
[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"

#precmd () {print -Pn "\e]0;%~\a"}
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/sross/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/sross/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/sross/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/sross/google-cloud-sdk/completion.zsh.inc'; fi

# source github token secret
# TODO move this into function
# source $HOME/.gh_token

[[ "$(uname)" != "Darwin" ]] && $HOME/.local/bin/cow-fortune


[ -f "/home/scott/.ghcup/env" ] && source "/home/scott/.ghcup/env" # ghcup-env