#!/bin/bash
set -e

BASE_PATH=$(git rev-parse --show-toplevel)

source $BASE_PATH/scripts/environment/error_exit.sh

# init.sh needs to be run before this.
if [[ $EUID -eq 0 ]]; then
  error_exit "program was not run in sudo, terminating"
fi

if ! command -v fish > /dev/null; then
  error_exit "fish shell not found in PATH, terminating"
fi

# Set fish shell as acceptable shell if it does not exist in the acceptable shell list.
if ! grep fish /etc/shells > /dev/null; then
  echo "$(command -v fish)" >> /etc/shells
fi

# Set fish shell as the default shell if it is not set as the default shell
if [[ $SHELL == "fish" ]]; then
  chsh -s "$(command -v fish)"
fi

FISH_CONFIG_PATH=$HOME/.config/fish

# Create configuration directory if it does not exist
mkdir -p $FISH_CONFIG_PATH

echo $BASE_PATH

# Create symlink for fish shell configuration 
rm -f $FISH_CONFIG_PATH/config.fish 2> /dev/null
ln -s $BASE_PATH/.config/fish/config.fish $FISH_CONFIG_PATH/config.fish

exit 0
