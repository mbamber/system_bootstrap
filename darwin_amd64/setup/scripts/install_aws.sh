#! /usr/bin/env zsh

/usr/bin/which -s pip3
if [[ $? != 0 ]];
then
  echo "[ERROR] pip3 not installed. Cannot install AWS CLI."
  exit 1
fi

/usr/bin/which -s aws
if [[ $? == 0 ]];
then
  echo "AWS CLI already installed. Skipping..."
else
  echo "Installing AWS CLI..."
  yes | pip3 install awscli --upgrade --user > /dev/null 2>&1
fi
echo "Done!"
