#!/usr/bin/env bash

mkdir "$HOME/.ssh"
mkdir "$HOME/.ssh/conf.d"
chmod 700 "$HOME/.ssh"

cat - << EOS > "$HOME/.ssh/config"
Include conf.d/*

Host *
  ServerAliveInterval 300
  IgnoreUnknown UseKeychain
  UseKeychain yes
EOS

chmod 644 "$HOME/.ssh/config"
