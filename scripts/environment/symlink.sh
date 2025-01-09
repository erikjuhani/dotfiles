#!/bin/sh

readonly BASE_PATH="$(git rev-parse --show-toplevel)"

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

# ghostty
rm -f "$HOME/.config/ghostty/config"
ln -s "$BASE_PATH/.config/ghostty/config" "$HOME/.config/ghostty/config"

# aerospace.toml
rm -f "$HOME/.aerospace.toml"
ln -s "$BASE_PATH/.aerospace.toml" "$HOME/.aerospace.toml"

# create sketchybar .config directory
mkdir -p "$HOME/.config/sketchybar"

# sketchybar
rm -r "$HOME/.config/sketchybar"
ln -s "$BASE_PATH/.config/sketchybar" "$HOME/.config/sketchybar"

# sketchybar-app-font
rm -f "$HOME/Library/Fonts/sketchybar-app-font.ttf"
# Symlink does not work with fonts
cp "$BASE_PATH/fonts/sketchybar-app-font.ttf" "$HOME/Library/Fonts/sketchybar-app-font.ttf"

# create borders .config directory
mkdir -p "$HOME/.config/borders"

# borders
rm -r "$HOME/.config/borders"
ln -s "$BASE_PATH/.config/borders" "$HOME/.config/borders"

# create nvim .config directory
mkdir -p "$HOME/.config/nvim"

# nvim
rm -r "$HOME/.config/nvim"
ln -s "$BASE_PATH/.config/nvim" "$HOME/.config/nvim"

# gitconfig
rm "$HOME/.gitconfig"
ln -s "$BASE_PATH/.gitconfig" "$HOME/.gitconfig"
