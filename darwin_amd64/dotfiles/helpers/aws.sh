#! /usr/bin/env zsh

echo "Enabling AWS CLI autocompletion..."

# Extract the python version
PYTHON_VERSION=$(cut -d . -f 1,2 <<< $(cut -f 2 -d ' ' <<< $(python3 --version)))
# Add the location of the AWS CLI to the PATH
export PATH=~/Library/Python/${PYTHON_VERSION}/bin:$PATH

# Check that the AWS CLI has been installed
/usr/bin/which -s aws_completer
if [[ $? != 0 ]];
then
  echo "[ERROR] AWS CLI not installed. Cannot configure autocompletion."
  return
fi

# Source completion
complete -C $(which aws_completer) aws
