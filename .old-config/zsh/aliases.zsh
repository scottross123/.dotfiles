# neovim instead of vim
alias vim="nvim"

# grep colors
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# "are you sure you want to overwrite x?"
alias cp="cp -i"
alias mv="mv -i"
# alias rm="rm -i"

# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4 | head -5'

# get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3 | head -5'

# update plugins
alias zsh-update-plugins="find "$ZDOTDIR/plugins" -type d -exec test -e '{}/.git' ';' -print0 | xargs -I {} -0 git -C {} pull -q"

# git shortcuts
alias ga="git add"
alias gc="git commit -m"
alias gco="git checkout"
alias gb="git branch"
alias gba="git branch -a"
alias gbd="git branch --delete"
alias gu="git reset --soft HEAD~1"
alias gst="git status"

# source
alias s="source ~/.config/zsh/.zshrc" 

# clear
alias c="clear"

# trash instead of rm
alias rm="trash"

# notes
alias notes="cat ~/Documents/notes.txt"
