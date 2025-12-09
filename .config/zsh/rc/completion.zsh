# -------------------------------------
# Completions
# -------------------------------------

# Terraform
[ -f $XDG_DATA_HOME/mise/installs/terraform/latest/bin/terraform ] && complete -o nospace -C $XDG_DATA_HOME/mise/installs/terraform/latest/bin/terraform terraform

# zoxide
[ -f $XDG_DATA_HOME/mise/shims/zoxide ] && eval "$(zoxide init zsh)"

# mise
[ -f $HOME/.local/bin/mise ] && eval "$(mise completion zsh)"

#  ghr
[ -f "$XDG_DATA_HOME/mise/shims/ghr" ] && eval "$(ghr shell bash --completion)"
