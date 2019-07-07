#! /usr/bin/env zsh

# Command line tools for XCode
echo "Installing Command Line Tools for XCode..."
xcode-select --install > /dev/null 2>&1
echo "Done"

# Install Homebrew if it isn't already installed
BREW_URL="https://raw.githubusercontent.com/Homebrew/install/master/install"

/usr/bin/which -s brew
if [[ $? == 0 ]];
then
  echo "Hombrew already installed. Skipping..."
else
  /usr/bin/ruby -e "$(curl -fsSL ${BREW_URL})" > /dev/null 2>&1
fi
echo "Done!"

echo "Updating homebrew..."
brew upgrade > /dev/null 2>&1
echo "Done!"
