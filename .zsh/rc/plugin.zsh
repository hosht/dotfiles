# -------------------------------------
# zinit
# -------------------------------------

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit.git "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/z-a-patch-dl \
    zdharma-continuum/z-a-as-monitor \
    zdharma-continuum/z-a-bin-gem-node

zinit light mollifier/anyframe
zinit light mollifier/cd-gitroot
zinit ice wait pick"src/macOS/macOS-zsh-completions.plugin.zsh" as"completion" lucid
zinit light zchee/zsh-completions
zinit light zdharma/fast-syntax-highlighting
zinit load  zdharma/history-search-multi-word
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-history-substring-search
zinit light azu/ni.zsh
# zinit ice atload'!_zsh_git_prompt_precmd_hook' lucid
# zinit load woefe/git-prompt.zsh

[ -f ${HOME}/.zsh/rc/pluginconfig/anyframe.zsh ] && source ${HOME}/.zsh/rc/pluginconfig/anyframe.zsh
