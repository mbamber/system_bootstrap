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
source ./helpers/aws.sh
source ./helpers/go.sh

cd "${CURR_DIR}"

# Source any machine specific configuration
CUSTOM_SCRIPT_PATH="$HOME/.custom_dotfiles"
if [[ -d "${CUSTOM_SCRIPT_PATH}" ]]
then
    cd "${CUSTOM_SCRIPT_PATH}"

    for f in $(find ${CUSTOM_SCRIPT_PATH} -iname '*.sh' -exec basename {} \;)
    do
        echo "Sourcing custom file: $f"
        source "$f"
    done

    cd "${CURR_DIR}"
fi
