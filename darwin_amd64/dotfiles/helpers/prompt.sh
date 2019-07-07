#! /usr/bin/env zsh

echo "Setting prompt..."

# Make sure the prompt directory is in the fpath
fpath=( ~/.zprompt $fpath )

# Load promptinit
autoload -Uz promptinit
promptinit

# Make sure colors are available
autoload -U colors && colors

# Choose the prompt to use
PROMPT_NAME="clean"
prompt "${PROMPT_NAME}"

echo "Setting window title..."

# Make sure we can set the hook
autoload -Uz add-zsh-hook

function xterm_title_precmd() {
    prefix=""

    # If we are in a git repo then set the title to the repo name, otherwise use the pwd
    pth=$(git rev-parse --show-toplevel 2> /dev/null)
    if [[ $? -eq 0 ]]; then
        prefix="[git] "
    else
        pth=$(pwd -P)
    fi

    # Just get the dir name
    dir_name=$(basename "${pth}")

    # Get the full title
    title="${prefix}${dir_name}"

    # Actually set the window title
    print -Pn "\e]2;${title}\a"
}

# Set the hook
if [[ "$TERM" == (screen*|xterm*|rxvt*) ]]; then
	add-zsh-hook -Uz precmd xterm_title_precmd
fi
