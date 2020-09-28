#! /usr/bin/env zsh

echo "Configuring Vim..."
 user=$(logname)

if [ -f "~/.vim/spellfile.en.utf-8.add" ]
then
    echo "Vim spellfile already created. Skipping..."
else
    mkdir -p ~/.vim
    touch ~/.vim/spellfile.en.utf-8.add
    chown -R ${user} "${HOME}/.vim"
fi

echo "Done!"
