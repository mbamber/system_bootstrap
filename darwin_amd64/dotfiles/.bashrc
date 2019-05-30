FULL_SCRIPT_PATH="$(readlink "$BASH_SOURCE")"
SCRIPT_DIR="$(cd "$(dirname ${FULL_SCRIPT_PATH})" ; pwd -P )"
CURR_DIR="$(pwd)"

cd "${SCRIPT_DIR}"

source ./helpers/base.sh
source ./helpers/git.sh
source ./helpers/terraform.sh
source ./helpers/homebrew.sh
source ./helpers/vscode.sh

cd "${CURR_DIR}"
