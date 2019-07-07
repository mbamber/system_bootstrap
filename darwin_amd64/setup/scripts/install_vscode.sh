#! /usr/bin/env zsh

if [ -d "/Applications/Visual Studio Code.app/" ];
then
  echo "VSCode already installed. Skipping..."
else
  echo "Installing VSCode..."

  /usr/bin/which -s wget
  if [[ $? != 0 ]];
  then
    echo "[ERROR] wget not available. Cannot install vscode."
    exit 1
  fi

  /usr/bin/which -s unzip
  if [[ $? != 0 ]];
  then
    echo "[ERROR] unzip not available. Cannot install vscode."
    exit 1
  fi

  DOWNLOAD_FROM="https://go.microsoft.com/fwlink/?LinkID=620882"
  # The link given by MS will redirect, so figure out where it redirects to
  DOWNLOAD_AFTER_REDIRECT=$(curl -Ls -o /dev/null -w %{url_effective} "${DOWNLOAD_FROM}")
  DOWNLOAD_AS="../target/vscode.zip"
  UNZIP_DIR="../target/vscode"

  # Download the file
  wget -O "${DOWNLOAD_AS}" "${DOWNLOAD_AFTER_REDIRECT}" > /dev/null 2>&1
  # Unzip it
  unzip -u -d "${UNZIP_DIR}" "${DOWNLOAD_AS}" > /dev/null 2>&1
  # Move it to Applications
  APP_PATH="${UNZIP_DIR}/$(ls "${UNZIP_DIR}")"
  sudo mv -f "${APP_PATH}" "/Applications"

  # Tidy up
  rm -r "${UNZIP_DIR}"
  rm -r "${DOWNLOAD_AS}"
fi
echo "Done!"

# Intall VSCode Extensions
echo "Installing VSCode extensions..."
INSTALLED_EXT=$(code --list-extensions)

declare -a EXT_LIST=(
  # Languages
  "ms-vscode.go" # Golang
  "redhat.java" # Java
  "mauve.terraform" # Terraform
  "ms-python.python" # Python

  # Tools
  "eamodio.gitlens" # Git
  "yzhang.markdown-all-in-one" # Markdown
  "vscjava.vscode-maven" # Maven

  # Keybinds
  "ms-vscode.atom-keybindings" # Atom keybinds
)

for ext in "${EXT_LIST[@]}";
do
  IS_INSTALLED=$(echo ${INSTALLED_EXT} | grep -q -i "${ext}")
  if [[ $? -eq 0 ]];
  then
    echo "  Extension ${ext} already installed. Skipping..."
  else
    echo "  Installing Extension ${ext}"
    code --install-extension "${ext}" > /dev/null 2>&1
  fi
  echo "  Done!"
done

echo "Done!"

echo "Copying VSCode keybindings..."
cp -f "./config/vscode_keybindings.json" "${HOME}/Library/Application Support/Code/User/keybindings.json"
echo "Done!"

echo "Copying VSCode settings..."
cp -f "./config/vscode_settings.json" "${HOME}/Library/Application Support/Code/User/settings.json"
echo "Done!"
