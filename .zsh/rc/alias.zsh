# -------------------------------------
# Aliases
# -------------------------------------

# aliased ls needs if file/dir completions work
setopt complete_aliases

# exa
alias ll="exa -la"

# tree
alias tree="tree -NC"

# tmux + screen-256colorでsshしたときにvimやtopが使えない対策
alias ssh='TERM=xterm ssh'

# git branch
alias gitbr=anyframe-widget-checkout-git-branch
