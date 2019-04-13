#!/usr/bin/env bash

echo "Adding terraform aliases..."

# Main Terraform aliases
alias tf="terraform"
alias tfa="terraform apply"
alias tfi="terraform init"
alias tfp="terraform plan"

# Landscape
alias tfl="terraform plan | landscape"

# CHTF
if [[ -f /usr/local/share/chtf/chtf.sh ]]; then
    source "/usr/local/share/chtf/chtf.sh"
fi
alias tfv="chtf"
