#!/usr/bin/env bash

if [ -d "/Applications/Visual Studio Code.app/" ];
then
  echo "VSCode already installed. Skipping..."
else
  echo "Installing VSCode..."

  which -s wget
  if [[ $? != 0 ]];
  then
    echo "[ERROR] wget not available. Cannot install vscode."
    exit 1
  fi

  which -s unzip
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
