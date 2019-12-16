# -------------------------------------
# Path
# -------------------------------------

# GNU/Linux commands installed via homebrew
# ref https://qiita.com/eumesy/items/3bb39fc783c8d4863c5f
path=(
    /usr/local/bin(N-/) # homebrew
    /usr/local/sbin(N-/) # homebrew
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
export PAGER=/usr/local/bin/vimpager
export MANPAGER=/usr/local/bin/vimpager

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# golang
export GOPATH="$HOME/works"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"
