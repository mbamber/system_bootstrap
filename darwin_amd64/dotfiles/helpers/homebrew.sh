#! /usr/bin/env zsh

# Source all completion scripts provided by homebrew
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi
