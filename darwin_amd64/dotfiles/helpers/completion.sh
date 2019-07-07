#! /usr/bin/env zsh

echo "Enabling autocompletion..."

# Enable auto completion
autoload -Uz compinit
compinit

# Arrow key driven interface
zstyle ':completion:*' menu select

# Enable sudo completion
zstyle ':completion::complete:*' gain-privileges 1
