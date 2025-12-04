# -------------------------------------
# zinit
# -------------------------------------

### Added by Zinit's installer
if [[ ! -f $XDG_DATA_HOME/zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$XDG_DATA_HOME/zinit" && command chmod g-rwX "$XDG_DATA_HOME/zinit"
    command git clone https://github.com/zdharma-continuum/zinit.git "$XDG_DATA_HOME/zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

ZPFX="$HOME/.local"
typeset -A ZINIT
ZINIT[MAN_DIR]="$ZPFX/share/man"
source "$XDG_DATA_HOME/zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light atuinsh/atuin
zinit light azu/ni.zsh
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
