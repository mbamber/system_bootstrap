#! /usr/bin/env zsh

/usr/bin/which -s brew
if [[ $? != 0 ]];
then
  echo "[ERROR] Homebrew not installed. Cannot install docker."
  exit 1
fi

/usr/bin/which -s docker
if [[ $? -eq 0 ]];
then
    echo "Docker already installed. Skipping..."
else
    echo "Installing Docker."
    brew cask install docker > /dev/null 2>&1
fi
echo "Done!"

# Start Docker if it isn't already
docker ps > /dev/null 2>&1
if [[ $? -eq 0 ]];
then
    echo "Docker is already running..."
else
    echo "Starting Docker..."
    sudo -u $(who am i | awk '{print $1}') zsh -c '/Applications/Docker.app/Contents/MacOS/Docker &'
    echo "Done!"
fi
