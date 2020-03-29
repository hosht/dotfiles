# -------------------------------------
# Base configurations
# -------------------------------------

# command history
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

# for zsh-completions
if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

# auto complete
autoload -Uz compinit
compinit

autoload -Uz bashcompinit
bashcompinit
