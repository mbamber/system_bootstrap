#!/usr/bin/env bash

which -s brew
if [[ $? != 0 ]];
then
  echo "[ERROR] Homebrew not installed. Cannot install utilities."
  exit 1
fi

which -s wget
if [[ $? == 0 ]];
then
  echo "wget already installed. Skipping..."
else
  echo "Installing wget..."
  brew install wget > /dev/null 2>&1
fi
echo "Done!"
