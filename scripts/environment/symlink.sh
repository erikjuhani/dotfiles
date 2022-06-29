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

# .tmux.conf
rm -f $HOME/.tmux.conf
ln -s $BASE_PATH/.tmux.conf $HOME/.tmux.conf

# .skhdrc
rm -f $HOME/.skhdrc
ln -s $BASE_PATH/.skhdrc $HOME/.skhdrc

# starship.toml
rm -f $HOME/starship.toml
ln -s $BASE_PATH/starship.toml $DESTINATION_CONFIG_PATH/starship.toml

# alacritty.yml
rm -f $HOME/.alacritty.yml
ln -s $BASE_PATH/.alacritty.yml $HOME/.alacritty.yml

# yabairc
rm -f $HOME/.yabairc
ln -s $BASE_PATH/.yabairc $HOME/.yabairc

# nvim
rm -r $DESTINATION_CONFIG_PATH/nvim
ln -s $CONFIG_PATH/nvim $DESTINATION_CONFIG_PATH/nvim
