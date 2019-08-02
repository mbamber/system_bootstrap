#! /usr/bin/env zsh

echo "Ensuring go is properly configured..."

export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH=$GOPATH:$GOBIN:$PATH
