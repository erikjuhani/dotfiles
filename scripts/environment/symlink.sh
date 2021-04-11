#!/bin/bash
# =============================== #
# Create soft links for dot files #
# =============================== #
BASE_PATH=$(git rev-parse --show-toplevel)
CONFIG_PATH=$BASE_PATH/.config
DESTINATION_CONFIG_PATH=$HOME/.config
DESTINATION_BIN_PATH=/usr/local/bin

# create nvim .config directory
mkdir -p $DESTINATION_CONFIG_PATH/nvim

# .vimrc
rm -f $HOME/.vimrc
ln -s $BASE_PATH/.vimrc $HOME/.vimrc

# nvim
rm -r $DESTINATION_CONFIG_PATH/nvim
ln -s $CONFIG_PATH/nvim $DESTINATION_CONFIG_PATH/nvim
