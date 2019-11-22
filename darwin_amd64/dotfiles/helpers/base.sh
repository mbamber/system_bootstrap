#! /usr/bin/env zsh

# Prepare for completion
autoload -U compinit && compinit
zmodload -i zsh/complist

# Alias some basic commands
echo "Adding basic aliases..."
alias ll="ls -l"

# Alias some network commands
echo "Adding network aliases..."
alias wmi="curl ifconfig.io" # Get my public IP Address
alias gateway="echo $(awk '{print $2}' <<< $(netstat -nr -f inet | grep default))" # Get the default IPV4 gateway
