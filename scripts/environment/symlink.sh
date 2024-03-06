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

# .skhdrc
rm -f "$HOME/.skhdrc"
ln -s "$BASE_PATH/.skhdrc" "$HOME/.skhdrc"

# starship.toml
rm -f "$HOME/.config/starship.toml"
ln -s "$BASE_PATH/starship.toml" "$HOME/.config/starship.toml"

# alacritty.toml
rm -f "$HOME/.alacritty.toml"
ln -s "$BASE_PATH/.alacritty.toml" "$HOME/.alacritty.toml"

# yabairc
rm -f "$HOME/.yabairc"
ln -s "$BASE_PATH/.yabairc" "$HOME/.yabairc"

# nvim
rm -r "$HOME/.config/nvim"
ln -s "$BASE_PATH/.config/nvim" "$HOME/.config/nvim"

# gitconfig
rm -r "$HOME/.gitconfig"
ln -s "$BASE_PATH/.gitconfig" "$HOME/.gitconfig"
