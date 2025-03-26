#! /usr/bin/env zsh

# Load Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Source all completion scripts provided by homebrew
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi
