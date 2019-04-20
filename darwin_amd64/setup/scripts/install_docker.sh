#!/usr/bin/env bash

which -s docker
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
    /Applications/Docker.app/Contents/MacOS/Docker &
    echo "Done!"
fi
