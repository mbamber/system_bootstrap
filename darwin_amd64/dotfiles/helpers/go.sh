#! /usr/bin/env zsh

echo "Ensuring go is properly configured..."

export GOROOT=/usr/local/go
export GOPATH=$GOROOT/bin
export PATH=$GOPATH:$PATH
