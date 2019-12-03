#!/bin/bash
# =============================== #
# Create soft links for dot files #
# =============================== #
BASE_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
CONFIG_PATH=$BASE_PATH/.config
DESTINATION_CONFIG_PATH=$HOME/.config

# fish config
ln -s $CONFIG_PATH/fish/config.fish $DESTINATION_CONFIG_PATH/fish/config.fish

# .vimrc
rm $HOME/.vimrc
ln -s $BASE_PATH/.vimrc $HOME/.vimrc

# nvim
rm -r $DESTINATION_CONFIG_PATH/nvim
ln -s $CONFIG_PATH/nvim $DESTINATION_CONFIG_PATH/nvim

if [[ "$OSTYPE" == "linux-gnu" ]]; then 
# remove existing symlink
rm -r $DESTINATION_CONFIG_PATH/xfce4/terminal/terminalrc
# xfce4 terminalrc
ln -s $CONFIG_PATH/xfce4/terminal/terminalrc $DESTINATION_CONFIG_PATH/xfce4/terminal/terminalrc
fi
