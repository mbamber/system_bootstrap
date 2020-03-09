#! /usr/bin/env zsh

echo "Adding git aliases..."

alias gl="git log --graph --decorate --color --pretty='format: %C(auto) %>(50,trunc)%d %h %<(100,trunc)%s %Cred %<(24)%cd %C(magenta) authored by: %<(20,trunc)%an' | less -R"
alias gle="git log --graph --decorate --color --pretty=oneline | emojify | less -R"
alias gcane="git commit --amend --no-edit"
gt() {
    git fetch --prune
    gonebranches=$(git branch -v | grep '\[gone\]')
    echo "$gonebranches"
    for b in $(echo $gonebranches | awk '{print $1}')
    do
        git branch -D "$b"
    done
}

# Setup GPG key signing
export GPG_TTY=$(tty)
