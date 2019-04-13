#!/usr/bin/env bash

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"

# Create a symlink in ~ to my bashrc file
echo "Syncing bashrc files..."
ln -s -f "${SCRIPT_PATH}"/../../dotfiles/.bashrc ~/.bashrc
echo "Done!"
