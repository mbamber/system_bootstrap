#! /usr/bin/env zsh

CURR_DIR=$(pwd -P)
FILE_PATH="$0:A"
WORKING_DIR=$(dirname "${FILE_PATH}")

if [[ $EUID -ne 0 ]]; then
    echo "Script must be run as root!"
    exit 1
fi

# Figure out who called the script, in case we need to de-escalate our privileges
export CALLER=$(who am i | awk '{print $1}')

# Move to the scripts running directory
cd "${WORKING_DIR}"

# Perform all the required installs
./scripts/install_homebrew.sh
./scripts/install_utils.sh
./scripts/install_python.sh
./scripts/install_git.sh
./scripts/install_tfswitch.sh
./scripts/install_aws.sh
./scripts/install_vim.sh

./scripts/install_prompt.sh

# Sync ~/.zshrc to our zshrc file
./scripts/sync.sh

# Move back to where we started
cd "${CURR_DIR}"
