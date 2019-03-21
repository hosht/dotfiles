# GUN coreutils
export PATH=/usr/local/opt/coreutils/libexec/gnubin:${PATH}
export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}

# pager
export PAGER=/usr/local/bin/vimpager
export MANPAGER=/usr/local/bin/vimpager

# MacVim
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# golang
export GOPATH=$HOME/.go
