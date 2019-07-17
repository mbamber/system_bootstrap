#! /usr/bin/env zsh

GO_VERSION="1.12.7"

/usr/bin/which -s wget
if [[ $? != 0 ]];
then
  echo "[ERROR] wget not installed. Cannot install AWS CLI."
  exit 1
fi

/usr/bin/which -s go
if [[ $? == 0 ]];
then
  echo "go already installed. Uninstalling..."
  rm -rf /usr/local/go
fi
echo "Installing go at version $GO_VERSION..."
wget -O ./target/go.tar.gz "https://dl.google.com/go/go$GO_VERSION.darwin-amd64.tar.gz" > /dev/null 2>&1
tar -C /usr/local -xzf ./target/go.tar.gz
chown -R $(logname) /usr/local/go
echo "Done!"
