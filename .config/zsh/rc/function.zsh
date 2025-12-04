# -------------------------------------
# Functions
# -------------------------------------

function gbr() {
    local branch=$(git branch -a --sort=-committerdate |
        grep -v HEAD |
        fzf --height 50% --reverse --preview 'git log --oneline --graph --color=always -n 20 {1}' |
        sed 's/^[* ]*//' |
        sed 's|remotes/origin/||')
    [[ -n "$branch" ]] && git switch "$branch"
}
