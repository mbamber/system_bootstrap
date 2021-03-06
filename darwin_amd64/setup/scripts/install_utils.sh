#! /usr/bin/env zsh

/usr/bin/which -s brew
if [[ $? != 0 ]];
then
  echo "[ERROR] Homebrew not installed. Cannot install utilities."
  exit 1
fi

/usr/bin/which -s wget
if [[ $? == 0 ]];
then
  echo "wget already installed. Skipping..."
else
  echo "Installing wget..."
  brew install wget > /dev/null 2>&1
fi
echo "Done!"

/usr/bin/which -s unzip
if [[ $? == 0 ]];
then
  echo "unzip already installed. Skipping..."
else
  echo "Installing unzip..."
  brew install unzip > /dev/null 2>&1
fi
echo "Done!"
