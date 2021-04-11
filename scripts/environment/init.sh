#!/bin/bash
set -e

BASE_PATH=$(git rev-parse --show-toplevel)

source $BASE_PATH/scripts/environment/error_exit.sh

# Check if runnning machine is a mac.
# If not end script.
if [[ "$OSTYPE" != "darwin"* ]]; then
  echo "Not on a darwin system, terminating"
  exit 1
fi

# First we install `homebrew` (if it doesn't exist) to make package management a breeze.
if ! command -v brew > /dev/null; then
  echo "Installing homebrew will require sudo access"
  # This will prompt for sudo access.
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew_package_install() {
  if ! command -v $1 > /dev/null; then
    brew install $2 $1
  else
    echo "package: $1 already installed"
  fi
}

# After this point we will use homebrew for all installations as it will be our main package manager.

# Git should always be found, but if not install git.
brew_package_install git

# Fish shell installation
brew_package_install fish

# Neovim installation
brew_package_install nvim

# Go installation
brew_package_install go

# Node installation
brew_package_install node

# Yarn installation
brew_package_install yarn

# Neovim environment installation
bash -c "curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

nvim --headless +PlugInstall +qall

# Docker installation
brew_package_install docker --cask > /dev/null

# Only run this if docker is not found in PATH
if ! command -v docker > /dev/null; then
  open /Applications/Docker.app
fi

exit 0
