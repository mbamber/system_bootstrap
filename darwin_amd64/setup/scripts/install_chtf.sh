#! /usr/bin/env zsh

/usr/bin/which -s brew
if [[ $? != 0 ]];
then
  echo "[ERROR] Homebrew not installed. Cannot install chtf."
  exit 1
fi

# Tap the repository
brew tap Yleisradio/terraforms > /dev/null 2>&1

/usr/bin/which -s chtf
if [[ $? == 0 ]];
then
  echo "chtf already installed. Skipping..."
else
  echo "Installing chtf..."
  brew install chtf > /dev/null 2>&1
fi
echo "Done!"
