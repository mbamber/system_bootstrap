#! /usr/bin/env zsh

# Git Completion
/usr/bin/which -s wget
if [[ $? != 0 ]];
then
  echo "[ERROR] wget not available. Cannot install git completion."
  exit 1
fi

# Git completion
OUT_PATH="../target/git_completion.zsh"
if [[ -f ${OUT_PATH} ]];
then
  echo "Git completion already installed. Skipping..."
else
  echo "Installing git completion..."
  mkdir -p ./target > /dev/null 2>&1
  wget -O "${OUT_PATH}" https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh > /dev/null 2>&1
fi
echo "Done!"
