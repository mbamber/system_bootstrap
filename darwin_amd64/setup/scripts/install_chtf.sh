#!/usr/bin/env bash

# Tap the repository
brew tap Yleisradio/terraforms > /dev/null 2>&1

which -s chtf
if [[ $? == 0 ]];
then
  echo "chtf already installed. Skipping..."
else
  echo "Installing chtf..."
  brew install chtf > /dev/null 2>&1
fi
echo "Done!"
