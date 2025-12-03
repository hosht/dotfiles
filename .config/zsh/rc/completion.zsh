# -------------------------------------
# Completions
# -------------------------------------

# Terraform
if [ -e $XDG_DATA_HOME/mise/installs/terraform/latest/bin/terraform ]; then
    complete -o nospace -C $XDG_DATA_HOME/mise/installs/terraform/latest/bin/terraform terraform
fi

# zoxide
if [ -e $XDG_DATA_HOME/mise/shims/zoxide ]; then
    eval "$(zoxide init zsh)"
fi

# mise
if [ -e /opt/homebrew/bin/mise ]; then
    eval "$(mise completion zsh)"
fi
