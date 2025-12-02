# -------------------------------------
# starship
# -------------------------------------

[ -f "/opt/homebrew/bin/starship" ] && eval "$(starship init zsh)"

# in ~/.zshenv, executed `unsetopt GLOBAL_RCS` and ignored /etc/zshrc
# [ -r /etc/zshrc ] && . /etc/zshrc

# -------------------------------------
# Base Configurations
# -------------------------------------

source "$XDG_CONFIG_HOME/zsh/rc/base.zsh"

# -------------------------------------
# Options
# -------------------------------------

source "$XDG_CONFIG_HOME/zsh/rc/option.zsh"

# -------------------------------------
# Prompt
# -------------------------------------

source "$XDG_CONFIG_HOME/zsh/rc/prompt.zsh"

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
[ -f "/opt/homebrew/bin/atuin" ] && eval "$(atuin init zsh)"

# -------------------------------------
# mise
# -------------------------------------
[ -e "/opt/homebrew/bin/mise" ] && eval "$(mise activate zsh)"

# -------------------------------------
# aqua
# -------------------------------------
[ -d "${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin" ] && export PATH="${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH"
