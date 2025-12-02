# -------------------------------------
# Base configurations
# -------------------------------------

# command history
HISTFILE="$XDG_STATE_HOME"/zsh/history
HISTSIZE=50000
SAVEHIST=50000

zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache

# auto complete
autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

autoload -Uz bashcompinit
bashcompinit
