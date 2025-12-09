#!/usr/bin/env bash

mise_installer="$(mktemp -d)"

if [[ "$OSTYPE" == "darwin"* ]]; then
  curl -fsSL https://mise.jdx.dev/install.sh -o "$mise_installer/mise_install.sh"
else
  gpg --keyserver hkps://keys.openpgp.org --recv-keys 24853EC9F655CE80B48E6C3A8B81C9D17413A06D
  curl -fsSL https://mise.jdx.dev/install.sh.sig | gpg --decrypt >"$mise_installer/mise_install.sh"
fi

sh "$mise_installer/mise_install.sh"
