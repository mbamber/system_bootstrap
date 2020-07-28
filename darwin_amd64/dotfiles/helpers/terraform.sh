#! /usr/bin/env zsh

echo "Adding terraform aliases..."

# Main Terraform aliases
alias tf="terraform"
alias tfa="terraform apply"
alias tfi="terraform init"
alias tfp="terraform plan"

# Landscape
alias tfl="terraform plan | landscape"

# tfswitch
load-tfswitch() {
  local tfswitchrc_path="config.tf"

  if [ -f "$tfswitchrc_path" ]; then
    echo -e "\e[35m" # Turn the text magenta
    tfswitch | grep "Switched terraform to"
    echo -e "\e[39m" # Reset the text color
  fi
}
add-zsh-hook chpwd load-tfswitch
load-tfswitch
alias tfv="tfswitch"
