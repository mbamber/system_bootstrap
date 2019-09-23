#! /usr/bin/env zsh

echo "Ensuring go is properly configured..."

export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH=$GOPATH:$GOBIN:$PATH

func gocoverage() {
    rm -rf ./.testcoverage
    mkdir -p ./.testcoverage
    for f in $(go list ./...); do
        go test -covermode=count -coverprofile ./.testcoverage/$(echo "$f" | tr / -).cover "$f"
    done
    echo "mode: count" > "./.testcoverage/all.out"
    grep -h -v "^mode:" ./.testcoverage/*.cover >> "./.testcoverage/all.out"

    go tool cover -html=./.testcoverage/all.out
}
