#!/bin/sh

readonly BASE_PATH="$(git rev-parse --show-toplevel)"

# create nvim .config directory
mkdir -p "$HOME/.config/nvim"

# .vimrc
rm -f "$HOME/.vimrc"
ln -s "$BASE_PATH/.vimrc" "$HOME/.vimrc"

# .tmux.conf
rm -f "$HOME/.tmux.conf"
ln -s "$BASE_PATH/.tmux.conf" "$HOME/.tmux.conf"

# starship.toml
rm -f "$HOME/.config/starship.toml"
ln -s "$BASE_PATH/starship.toml" "$HOME/.config/starship.toml"

# fish config
rm -f "$HOME/.config/fish/config.fish"
ln -s "$BASE_PATH/.config/fish/config.fish" "$HOME/.config/fish/config.fish"

# alacritty.toml
rm -f "$HOME/.alacritty.toml"
ln -s "$BASE_PATH/.alacritty.toml" "$HOME/.alacritty.toml"


# nvim
rm -r "$HOME/.config/nvim"
ln -s "$BASE_PATH/.config/nvim" "$HOME/.config/nvim"

# gitconfig
rm "$HOME/.gitconfig"
ln -s "$BASE_PATH/.gitconfig" "$HOME/.gitconfig"
