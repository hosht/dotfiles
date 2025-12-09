# in ~/.zshenv, executed `unsetopt GLOBAL_RCS` and ignored /etc/zshrc
# [ -r /etc/zshrc ] && . /etc/zshrc

# -------------------------------------
# mise
# -------------------------------------
[ -f "$HOME/.local/bin/mise" ] && eval "$(mise activate zsh)"

# -------------------------------------
# Base Configurations
# -------------------------------------

source "$XDG_CONFIG_HOME/zsh/rc/base.zsh"

# -------------------------------------
# Options
# -------------------------------------

source "$XDG_CONFIG_HOME/zsh/rc/option.zsh"

# -------------------------------------
# Aliases
# -------------------------------------

source "$XDG_CONFIG_HOME/zsh/rc/alias.zsh"

# -------------------------------------
# Key binds
# -------------------------------------

source "$XDG_CONFIG_HOME/zsh/rc/keybind.zsh"

# -------------------------------------
# Functions
# -------------------------------------

source "$XDG_CONFIG_HOME/zsh/rc/function.zsh"

# -------------------------------------
# Completions
# -------------------------------------

source "$XDG_CONFIG_HOME/zsh/rc/completion.zsh"

# -------------------------------------
# zplugin
# -------------------------------------

source "$XDG_CONFIG_HOME/zsh/rc/plugin.zsh"

# -------------------------------------
# .zshrc.local
# -------------------------------------
[ -f "$XDG_CONFIG_HOME/zsh/.zshrc.local" ] && source "$XDG_CONFIG_HOME/zsh/.zshrc.local"

# -------------------------------------
# op
# -------------------------------------
[ -f "/opt/homebrew/bin/op" ] && source "$HOME/.config/op/plugins.sh"

# -------------------------------------
# atuin
# -------------------------------------
[ -f "$XDG_DATA_HOME/mise/shims/atuin" ] && eval "$(atuin init zsh)"

# -------------------------------------
# starship
# -------------------------------------
[ -f "$XDG_DATA_HOME/mise/shims/starship" ] && eval "$(starship init zsh)"

# -------------------------------------
# broot
# -------------------------------------
[ -f "$XDG_CONFIG_HOME/broot/launcher/bash/br" ] && source "$XDG_CONFIG_HOME/broot/launcher/bash/br"

# -------------------------------------
# ghr
# -------------------------------------
[ -f "$XDG_DATA_HOME/mise/shims/ghr" ] && eval "$(ghr shell bash)"

# -------------------------------------
# zellij
# -------------------------------------
[ -f "$XDG_DATA_HOME/mise/shims/zellij" ] && eval "$(zellij setup --generate-auto-start zsh)"

# -------------------------------------
# aqua
# -------------------------------------
[ -d "${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin" ] && export PATH="${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH"
