#! /usr/bin/env zsh

echo "Adding git aliases..."

alias gl="git log --pretty=oneline --graph --decorate --color | emojify | less -R"
gt() {
    git fetch --prune
    gonebranches=$(git branch -v | grep '\[gone\]')
    echo "$gonebranches"
    for b in $(echo $gonebranches | awk '{print $1}')
    do
        git branch -D "$b"
    done
}
