# -------------------------------------
# XDG Base Directory Specification
# -------------------------------------
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_STATE_HOME="${HOME}/.local/state"
export XDG_CACHE_HOME="${HOME}/.cache"

# -------------------------------------
# Path
# -------------------------------------

export PATH
export MANPATH

# -U: keep only the first occurrence of each duplicated value
# ref. http://zsh.sourceforge.net/Doc/Release/Shell-Builtin-Commands.html#index-typeset
typeset -U PATH path cdpath fpath MANPATH manpath

# ignore /etc/zprofile, /etc/zshrc, /etc/zlogin, and /etc/zlogout
# ref. http://zsh.sourceforge.net/Doc/Release/Files.html
# ref. http://zsh.sourceforge.net/Doc/Release/Options.html#index-GLOBALRCS
unsetopt GLOBAL_RCS
# copied from /etc/zprofile
# system-wide environment settings for zsh(1)
if [ -x /usr/libexec/path_helper ]; then
    eval `/usr/libexec/path_helper -s`
fi

# GNU/Linux commands installed via homebrew
# ref https://qiita.com/eumesy/items/3bb39fc783c8d4863c5f
path=(
    /usr/local/bin(N-/) # homebrew
    /usr/local/sbin(N-/) # homebrew
    /opt/homebrew/bin(N-/) # homebrew
    /opt/homebrew/sbin(N-/) # homebrew
    /usr/local/opt/coreutils/libexec/gnubin(N-/) # coreutils
    /usr/local/opt/ed/libexec/gnubin(N-/) # ed
    /usr/local/opt/findutils/libexec/gnubin(N-/) # findutils
    /usr/local/opt/gnu-sed/libexec/gnubin(N-/) # sed
    /usr/local/opt/gnu-tar/libexec/gnubin(N-/) # tar
    /usr/local/opt/grep/libexec/gnubin(N-/) # grep
    ${path}
)
manpath=(
    /usr/local/share/man(N-/) # homebrew
    /usr/local/opt/coreutils/libexec/gnuman(N-/) # coreutils
    /usr/local/opt/ed/libexec/gnuman(N-/) # ed
    /usr/local/opt/findutils/libexec/gnuman(N-/) # findutils
    /usr/local/opt/gnu-sed/libexec/gnuman(N-/) # sed
    /usr/local/opt/gnu-tar/libexec/gnuman(N-/) # tar
    /usr/local/opt/grep/libexec/gnuman(N-/) # grep
    ${manpath}
)

# -------------------------------------
# Environment variables
# -------------------------------------

# LANG
export LANG=ja_JP.UTF-8
case ${UID} in
0)
    LANG=C
    ;;
esac

# Locale
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# pager
export PAGER=/usr/bin/less
export MANPAGER=/usr/bin/less

# golang
export GOPATH="$HOME/works"
export PATH="$GOPATH/bin:$PATH"

# GPG
export GPG_TTY=$(tty)

# Python
export PATH="$HOME/.local/bin:$PATH"

# mise
export MISE_NODE_COREPACK=1
export MISE_PIN=1
export MISE_RUBY_DEFAULT_PACKAGES_FILE="$XDG_CONFIG_HOME/gem/default-gems"
export MISE_NODE_DEFAULT_PACKAGES_FILE="$XDG_CONFIG_HOME/npm/default-npm-packages"

# brew
export HOMEBREW_VERIFY_ATTESTATIONS=1

# sfw for ni
export NI_USE_SOCKET_FIREWALL=1

# AWS
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME"/aws/credentials
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config

# Docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker

# less
export LESSHISTFILE="$XDG_STATE_HOME"/less/history

# npm
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc

# psql
export PSQL_HISTORY="$XDG_DATA_HOME/psql_history"

# Ruby
# export IRBRC="$XDG_CONFIG_HOME/irb/irbrc"
export GEMRC="$XDG_CONFIG_HOME/gem/gemrc"
export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle

# tealdeer
export TEALDEER_CONFIG_DIR="$XDG_CONFIG_HOME"/tealdeer/

# ghr
export GHR_ROOT="$HOME"/works/src/
