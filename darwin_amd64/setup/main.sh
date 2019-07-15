#! /usr/bin/env zsh

CURR_DIR=$(pwd -P)
FILE_PATH="$0:A"
WORKING_DIR=$(dirname "${FILE_PATH}")

# Move to the scripts running directory
cd "${WORKING_DIR}"

# Perform all the required installs
./scripts/install_homebrew.sh
./scripts/install_utils.sh
./scripts/install_git.sh
./scripts/install_chtf.sh
./scripts/install_vscode.sh
./scripts/install_docker.sh
./scripts/install_aws.sh

./scripts/install_prompt.sh

# Sync ~/.zshrc to our zshrc file
./scripts/sync.sh

# Move back to where we started
cd "${CURR_DIR}"
