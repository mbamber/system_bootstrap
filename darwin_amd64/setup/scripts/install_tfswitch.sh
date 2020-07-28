#! /usr/bin/env zsh

/usr/bin/which -s brew
if [[ $? != 0 ]];
then
  echo "[ERROR] Homebrew not installed. Cannot install tfswitch."
  exit 1
fi

/usr/bin/which -s tfswitch
if [[ $? == 0 ]];
then
  echo "tfswitch already installed. Skipping..."
else
  echo "Installing tfswitch..."
  sudo -u ${CALLER} brew install warrensbox/tap/tfswitch > /dev/null 2>&1
fi
echo "Done!"
