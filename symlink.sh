# =============================== #
# Create soft links for dot files #
# =============================== #

BASE_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

# remove existing symlinks
rm -r $HOME/.config/nvim
rm $HOME/.vimrc

# .vimrc
ln -s $BASE_PATH/.vimrc $HOME/.vimrc

# nvim
ln -s $BASE_PATH/.config/nvim $HOME/.config/nvim
