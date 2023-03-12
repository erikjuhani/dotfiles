#!/usr/bin/env sh

# Less manual work, when installing brew packages (doesn't ask for confirmation)
NONINTERACTIVE=1

BREW_CASK_DEPENDENCIES=(
  # Terminal emulator
  alacritty
  # Cli browser
  lynx
  # Slack
  slack
  # Apps
  figma
  # needed for hyperkey(capslock)
  karabiner-elements
)

BREW_DEPENDENCIES=(
  delta
  # Terminal
  fish
  starship
  # Editor
  nvim
  # Search / find
  ripgrep
  fzf
  # Session mangement
  tmux
  # Virtualization
  podman
  # GUI tools
  yabai
  skhd
  # Languages
  python3
  go
  rust
  node
  luajit
  # Better cat with syntax highlights
  bat
  # Package manager for node/yarn projects
  yarn
  # Used for generating diagrams from plantuml
  plantuml
  # Manipulate json data
  jq
  # Fun
  gum
  # Cli markdown reader
  glow
  # Better sed
  sd
  # Shorter man pages with examples
  tldr
  # Test cli perf
  hyperfine
  # System information
  gtop
  gping
  # Like Z better cd
  zoxide
  # Font
  # TODO: check why font install doesn't work
  # font-jetbrains-mono-nerd-font
  # Github cli tool
  gh
)

############################
# TRACE AND ERROR HANDLING #
############################

# exit on error
set -o errexit

# exit on <Ctrl-c>
trap 'exit 2' SIGINT

# trace
if [[ "${TRACE-0}" == "1" ]]; then
    set -o xtrace
fi

# Check if runnning machine is a mac.
# If not end script.
if [[ "$OSTYPE" != "darwin"* ]]; then
  echo "Not on a darwin system, terminating"
  exit 1
fi

# Check for command existance
command_exists() {
  if command -v $1 > /dev/null; then
    return 0
  else
    return 1
  fi
}

# Install packages using brew
brew_install() {
  if ! brew ls $1 1> /dev/null 2> /dev/null; then
    echo "Installing $1"
    brew install -q $2 $1
  fi
}

# Check if brew is found. If not Install brew
# Brew is used to manage all/most applications in this setup
if ! command_exists brew; then
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
fi

# Install git through brew if not found
if ! command_exists git; then
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
fi

echo "Installing brew packages"
for dep in "${BREW_DEPENDENCIES[@]}"
do
  brew_install $dep
done

for dep in "${BREW_CASK_DEPENDENCIES[@]}"
do
  brew_install $dep "--cask"
done

exit 0
