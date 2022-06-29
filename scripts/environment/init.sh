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

# setup brew bin path
echo -n "export PATH=/opt/homebrew/bin:$PATH" >> $HOME/.zprofile
source $HOME/.zprofile

brew_package_install() {
  if ! command -v $1 > /dev/null; then
    brew install $2 $1
  else
    echo "package: $1 already installed"
  fi
}

# After this point we will use homebrew for all installations as it will be our main package manager.

# git should always be found, but if not install git - version control
brew_package_install git

# commandline shell
brew_package_install fish

# python3
brew_package_install python3

# text editor
brew_package_install nvim

# go
brew_package_install go

# nodejs 
brew_package_install node

# node package manager
brew_package_install yarn

# hotkey daemon
brew_package_install skhd

# window manager
brew_package_install yabai

# terminal emulator
brew_package_install alacritty

# Neovim environment installation
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
nvim --headless +PackerUpdate +PackerCompile +qa
pip3 install pynvim --user
# yarn global add neovim

# Docker installation
# TODO: enable this for m1
# brew_package_install docker --cask > /dev/null

# Only run this if docker is not found in PATH
# TODO: enable this for m1
#if ! command -v docker > /dev/null; then
#  open /Applications/Docker.app
#fi

# preferred nerd font
brew_package_install font-jetbrains-mono-nerd-font

# starship prompt installation
brew_package_install starship

# slack
brew_package_install slack --cask

# karabiner-elements (required for hyperkey)
brew_package_install karabiner-elements

exit 0
