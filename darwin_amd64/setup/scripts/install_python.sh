#! /usr/bin/env zsh

/usr/bin/which -s brew
if [[ $? != 0 ]];
then
  echo "[ERROR] Homebrew not installed. Cannot install Python3."
  exit 1
fi

/usr/bin/which -s python3
if [[ $? == 0 ]];
then
  echo "Python3 already installed. Skipping..."
else
  echo "Installing Python3..."
  brew install python > /dev/null 2>&1
fi
echo "Done!"
