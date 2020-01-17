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

function youtrack-select-my-issue() {
    youtrack i f -r -q "for: me State: -終了 sort by: State desc" \
        | jq -r '(map(keys) | add | unique) as $cols | map(. as $row | $cols | map($row[.])) as $rows | $cols, $rows[] | @csv' \
        | xsv select 'id,summary,Priority,State' \
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

# -------------------------------------
# prompt
# -------------------------------------

autoload -U promptinit; promptinit
autoload -Uz colors; colors
autoload -Uz vcs_info
autoload -Uz is-at-least

# begin VCS
zstyle ":vcs_info:*" enable git svn hg bzr
zstyle ":vcs_info:*" formats "(%s)-[%b]"
zstyle ":vcs_info:*" actionformats "(%s)-[%b|%a]"
zstyle ":vcs_info:(svn|bzr):*" branchformat "%b:r%r"
zstyle ":vcs_info:bzr:*" use-simple true

zstyle ":vcs_info:*" max-exports 6

if is-at-least 4.3.10; then
    zstyle ":vcs_info:git:*" check-for-changes true
    zstyle ":vcs_info:git:*" stagedstr "<S>"
    zstyle ":vcs_info:git:*" unstagedstr "<U>"
    zstyle ":vcs_info:git:*" formats "(%b) %c%u"
    zstyle ":vcs_info:git:*" actionformats "(%s)-[%b|%a] %c%u"
fi

function vcs_prompt_info() {
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && echo -n " %{$fg[yellow]%}$vcs_info_msg_0_%f"
}
# end VCS

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

# grep
alias grep="grep --color -n -I --exclude='*.svn-*' --exclude='entries' --exclude='*/cache/*'"

# ls
case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -G"
    ;;
linux*)
    alias ls="ls --color"
    ;;
esac

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

# function cdup() {
#    echo
#    cd ..
#    zle reset-prompt
# }
# zle -N cdup
# bindkey '^K' cdup

# -------------------------------------
# terminal configuration
# -------------------------------------

case "${TERM}" in
screen)
    TERM=xterm
    ;;
esac

case "${TERM}" in
xterm|xterm-color)
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
kterm-color)
    stty erase '^H'
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
kterm)
    stty erase '^H'
    ;;
cons25)
    unset LANG
    export LSCOLORS=ExFxCxdxBxegedabagacad
    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
jfbterm-color)
    export LSCOLORS=gxFxCxdxBxegedabagacad
    export LS_COLORS='di=01;36:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;36;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
esac

# set terminal title including current directory
case "${TERM}" in
xterm|xterm-color|kterm|kterm-color)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

# load user .zshrc configuration file
[ -f ${HOME}/.zshrc.mine ] && source ${HOME}/.zshrc.mine

# -------------------------------------
# rbenv
# -------------------------------------
eval "$(rbenv init -)"

# -------------------------------------
# nodenv
# -------------------------------------
eval "$(nodenv init -)"
