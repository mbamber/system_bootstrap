#! /usr/bin/env zsh

CURR_DIR=$(pwd -P)
FILE_PATH="$(readlink ${(%):-%N})"
SCRIPT_PATH=$(dirname "${FILE_PATH}")

cd "${SCRIPT_PATH}"

source ./helpers/base.sh
source ./helpers/prompt.sh
source ./helpers/completion.sh
source ./helpers/git.sh
source ./helpers/terraform.sh
source ./helpers/homebrew.sh
source ./helpers/vscode.sh

cd "${CURR_DIR}"
