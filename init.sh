#!/usr/bin/env sh

set -e

# Download shm if it doesn't exist
if ! command -v "shm" >/dev/null; then
  curl -sSL https://raw.githubusercontent.com/erikjuhani/shm/main/shm.sh | sh
  if ! command -v "shm" >/dev/null; then
    printf "%s" "Initialize PATH for shm, then run this script again"
    exit 2
  fi
fi

shm get erikjuhani/tm
shm get erikjuhani/ql
shm get erikjuhani/git-fixup

if ! command -v "shm" >/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew bundle
