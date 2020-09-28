#! /usr/bin/env zsh

FILE_PATH="$0:A"
SCRIPT_PATH=$(dirname "${FILE_PATH}")

# Create a symlink in ~ to our zshrc file
echo "Syncing zshrc files..."
ln -s -f "${SCRIPT_PATH}"/../../dotfiles/.zshrc ~/.zshrc
echo "Done!"

echo "Syncing other important files..."
ln -s -f "${SCRIPT_PATH}"/../../dotfiles/.vimrc ~/.vimrc
echo "Done!"
