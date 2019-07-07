#! /usr/bin/env zsh

echo "Configuring prompt..."

PROMPT_DIR=~/.zprompt
PROMPT_NAME="clean"

# Make the prompt directory
if [[ ! -d "${PROMPT_DIR}" ]]; then
    mkdir -p "${PROMPT_DIR}"
fi

# Copy the prompt setup to the prompt dir
SCRIPT_PATH=$(dirname "$0:A")
ln -fs "${SCRIPT_PATH}/../config/prompt_${PROMPT_NAME}.zsh" "${PROMPT_DIR}/prompt_${PROMPT_NAME}_setup"

echo "Done!"
