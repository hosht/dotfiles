#!/usr/bin/env zsh
set -eu

# https://wiki.archlinux.org/title/XDG_Base_Directory
mkdir -p "${HOME}/.local/state"
mkdir -p "${HOME}/.config"
mkdir -p "${HOME}/.local/share"
mkdir -p "${HOME}/.cache"
