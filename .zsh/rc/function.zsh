# -------------------------------------
# Functions
# -------------------------------------

function ghqfzf() {
    anyframe-widget-cd-ghq-repository
}

# git-foresta
function gitfo() { git-foresta --style=10 "$@" | less -RSX }
function gitfoa() { git-foresta --all --style=10 "$@" | less -RSX }
# FIXME
# Completion not working
# $ gitfo _git:12: command not found: __git-log_main
compdef _git gitfo=git-log
compdef _git gitfoa=git-log

function ghpr() {
    gh pr list \
        | xsv table \
        | anyframe-selector-auto \
        | awk '{print $(NF-5)}' \
        | anyframe-action-execute git switch
}

# gcloud cli
function gcactivate() {
     gcloud config configurations list \
        | tail -n +2 \
        | xsv table \
        | anyframe-selector-auto \
        | awk '{print $1}' \
        | anyframe-action-execute gcloud config configurations activate
}
