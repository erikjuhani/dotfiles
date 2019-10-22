#!/bin/bash
# =============================== #
# Create soft links for dot files #
# =============================== #

BASE_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
CONFIG_PATH=$BASE_PATH/.config

# remove existing symlinks
rm -r $HOME/.config/xfce4/terminal/terminalrc
rm -r $HOME/.config/nvim
rm $HOME/.vimrc

# .vimrc
ln -s $CONFIG_PATH/.vimrc $HOME/.vimrc

# nvim
ln -s $CONFIG_PATH/.config/nvim $HOME/.config/nvim

if [[ "$OSTYPE" == "linux-gnu" ]]; then 
# xfce4 terminalrc
ln -s $CONFIG_PATH/.config/xfce4/terminal/terminalrc $HOME/.config/xfce4/terminal/terminalrc

fi
