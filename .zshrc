# in ~/.zshenv, executed `unsetopt GLOBAL_RCS` and ignored /etc/zshrc
[ -r /etc/zshrc ] && . /etc/zshrc

# -------------------------------------
# zplugin
# -------------------------------------

source ~/.zplugin/bin/zplugin.zsh

zplugin light b4b4r07/enhancd
zplugin light mollifier/anyframe
zplugin ice wait pick"src/macOS/macOS-zsh-completions.plugin.zsh" as"completion" lucid
zplugin light zchee/zsh-completions
zplugin light zdharma/fast-syntax-highlighting
zplugin load  zdharma/history-search-multi-word
zplugin light zsh-users/zsh-autosuggestions
zplugin light zsh-users/zsh-history-substring-search

# -------------------------------------
# anyframe
# -------------------------------------

zstyle ":anyframe:selector:" use fzf-tmux

# Avoid conflicts
function ghqfzf() {
    unalias cd
    anyframe-widget-cd-ghq-repository
    alias cd=__enhancd::cd
}

function youtrack-my-issue() {
    youtrack i f -r -q "for: me State: -終了 sort by: State desc" \
        | jq -r '(map(keys) | add | unique) as $cols | map(. as $row | $cols | map($row[.])) as $rows | $cols, $rows[] | @csv' \
        | xsv select 'id,summary,State' \
        | xsv table \
        | sed '1d' \
        | anyframe-selector-auto \
        | awk '{print $1}' \
        | anyframe-action-execute unbuffer youtrack i s \
        | less -qr
}

# -------------------------------------
# zsh options
# -------------------------------------

# for zsh-completions
if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

# auto complete
autoload -Uz compinit
compinit

autoload -Uz bashcompinit
bashcompinit

# suggest when mistake
setopt correct

# compacked complete list display
setopt list_packed

# nobeep sound
setopt nobeep

setopt nolistbeep

# no remove postfix slash of command line
setopt noautoremoveslash

# use color
setopt prompt_subst

# prevent logout from ^D
setopt ignoreeof

# notyfy when a background job finished
setopt no_tify

# not add repeated commands to history
setopt hist_ignore_dups

# command history
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt share_history

# completion

# disable tab for files order
unsetopt auto_menu

# incldue ~/.ssh/config
hosts=( ${(@)${${(M)${(s:# :)${(zj:# :)${(Lf)"$([[ -f ~/.ssh/config ]] && < ~/.ssh/config)"}%%\#*}}#host(|name) *}#host(|name) }/\*} )
zstyle ':completion:*:hosts' hosts $hosts

# cd -[tab] jump past directories
setopt auto_pushd

# cd with just directory name
setopt auto_cd

# AWS CLI
if [ -e /usr/local/bin/aws_completer ]; then
  complete -C '/usr/local/bin/aws_completer' aws
fi

# -------------------------------------
# prompt
# -------------------------------------

autoload -U promptinit; promptinit
autoload -Uz colors; colors
autoload -Uz vcs_info
autoload -Uz is-at-least

case ${UID} in
0)
    PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') %B%{${fg[red]}%}%/#%{${reset_color}%}%b "
    PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
    SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
    ;;
*)
    PROMPT="%{${fg[red]}%}%/%%%{${reset_color}%} "
    PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
    SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
        PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
    ;;
esac

# -------------------------------------
# alias
# -------------------------------------

# aliased ls needs if file/dir completions work
setopt complete_aliases

# exa
alias ll="exa -la"

# tree
alias tree="tree -NC"

# git-foresta
function gitfo() { git-foresta --style=10 "$@" | less -RSX }
function gitfoa() { git-foresta --all --style=10 "$@" | less -RSX }
# FIXME
# Completion not working
# $ gitfo _git:12: command not found: __git-log_main
compdef _git gitfo=git-log
compdef _git gitfoa=git-log

# tmux + screen-256colorでsshしたときにvimやtopが使えない対策
alias ssh='TERM=xterm ssh'

alias gitbr=anyframe-widget-checkout-git-branch

# YouTrack issues
alias youtrack-selfassigned='youtrack i f -q "for: me State: -終了 sort by: State desc"'

# -------------------------------------
# key bind
# -------------------------------------

bindkey -e

# load user .zshrc configuration file
[ -f ${HOME}/.zshrc.mine ] && source ${HOME}/.zshrc.mine

# -------------------------------------
# anyenv
# -------------------------------------
eval "$(anyenv init -)"
