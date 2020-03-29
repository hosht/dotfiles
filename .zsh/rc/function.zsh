# -------------------------------------
# Functions
# -------------------------------------

# Avoid conflicts
function ghqfzf() {
    unalias cd
    anyframe-widget-cd-ghq-repository
    alias cd=__enhancd::cd
}

# git-foresta
function gitfo() { git-foresta --style=10 "$@" | less -RSX }
function gitfoa() { git-foresta --all --style=10 "$@" | less -RSX }
# FIXME
# Completion not working
# $ gitfo _git:12: command not found: __git-log_main
compdef _git gitfo=git-log
compdef _git gitfoa=git-log
