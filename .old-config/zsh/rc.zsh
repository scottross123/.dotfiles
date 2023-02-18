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

source "$ZDOTDIR/functions.zsh"

# add files to source
zsh_add_file "exports.zsh"
zsh_add_file "vim.zsh"
zsh_add_file "aliases.zsh"
zsh_add_file "prompt.zsh"

# plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# key bindings
bindkey "^p" up-line-or-beginning-search # Up
bindkey "^n" down-line-or-beginning-search # Down

# vscode
[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"
