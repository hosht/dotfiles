# -------------------------------------
# Aliases
# -------------------------------------

# aliased ls needs if file/dir completions work
setopt complete_aliases

# lsd
alias ll="lsd -la"

# tmux + screen-256colorでsshしたときにvimやtopが使えない対策
alias ssh='TERM=xterm ssh'

# git branch
alias gbr=anyframe-widget-checkout-git-branch

alias cdu='cd-gitroot'

alias gp='git pull'

alias gs='git status'

alias gd='git difftool'

alias gaa='git add --all'

alias gprm='gh pr merge -m -d'

# gcloud cli
alias gccurrent='gcloud config configurations list'

alias gitfo='git log --oneline --graph --all'
alias gitfoa='git log --oneline --graph --all'

# broot
alias tree='broot -c ":pt"'
alias btree='broot -c ":pt"'

# bat
alias cat='bat'
