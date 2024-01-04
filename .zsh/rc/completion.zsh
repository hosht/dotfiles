# -------------------------------------
# Completions
# -------------------------------------

# incldue ~/.ssh/config
hosts=( ${(@)${${(M)${(s:# :)${(zj:# :)${(Lf)"$([[ -f ~/.ssh/config ]] && < ~/.ssh/config)"}%%\#*}}#host(|name) *}#host(|name) }/\*} )
zstyle ':completion:*:hosts' hosts $hosts

# AWS CLI
if [ -e /usr/local/bin/aws_completer ]; then
    complete -C /usr/local/bin/aws_completer aws
fi

# Terraform
if [ -e /usr/local/bin/terraform ]; then
    complete -o nospace -C /usr/local/bin/terraform terraform
fi

# zoxide
if [ -e /usr/local/bin/zoxide ]; then
    eval "$(zoxide init zsh)"
fi
