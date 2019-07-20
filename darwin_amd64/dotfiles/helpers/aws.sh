#! /usr/bin/env zsh

echo "Enabling AWS CLI autocompletion..."

/usr/bin/which -s aws_completer
if [[ $? != 0 ]];
then
  echo "[ERROR] AWS CLI not installed. Cannot configure autocompletion."
  return
fi

completer_path=$(dirname $(which aws_completer))
export PATH=$completer_path:$PATH
source "$completer_path/aws_zsh_completer.sh"
