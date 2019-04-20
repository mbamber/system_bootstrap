#!/usr/bin/env bash

CURR_DIR=$(pwd -P)
WORKING_DIR=$(dirname ${BASH_SOURCE})

cd ${WORKING_DIR}

# Perform all the required installs
./scripts/install_homebrew.sh
./scripts/install_utils.sh
./scripts/install_git.sh
./scripts/install_chtf.sh
./scripts/install_vscode.sh
./scripts/install_docker.sh

# Sync ~/.bashrc to my bashrc file
./scripts/sync.sh

cd ${CURR_DIR}
