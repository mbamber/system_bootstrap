#!/usr/bin/env bash

echo "Adding git aliases..."

alias gl="git log --pretty=oneline --graph --decorate --color | emojify"

# Source git completion
if [ -f ../target/git_completion.bash ];
then
  source ../target/git_completion.bash > /dev/null 2>&1
else
  echo "[WARN] Could not source git completion"
fi
