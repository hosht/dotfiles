# in ~/.zshenv, executed `unsetopt GLOBAL_RCS` and ignored /etc/zshrc
[ -r /etc/zshrc ] && . /etc/zshrc

# -------------------------------------
# Base Configurations
# -------------------------------------

source "$HOME/.zsh/rc/base.zsh"

# -------------------------------------
# Options
# -------------------------------------

source "$HOME/.zsh/rc/option.zsh"

# -------------------------------------
# Prompt
# -------------------------------------

source "$HOME/.zsh/rc/prompt.zsh"

# -------------------------------------
# Aliases
# -------------------------------------

source "$HOME/.zsh/rc/alias.zsh"

# -------------------------------------
# Key binds
# -------------------------------------

source "$HOME/.zsh/rc/keybind.zsh"

# -------------------------------------
# Functions
# -------------------------------------

source "$HOME/.zsh/rc/function.zsh"

# -------------------------------------
# Completions
# -------------------------------------

source "$HOME/.zsh/rc/completion.zsh"

# -------------------------------------
# zplugin
# -------------------------------------

source "$HOME/.zsh/rc/plugin.zsh"

# -------------------------------------
# .zshrc.local
# -------------------------------------
[ -f ${HOME}/.zshrc.local ] && source ${HOME}/.zshrc.local

# -------------------------------------
# anyenv
# -------------------------------------
eval "$(anyenv init -)"
