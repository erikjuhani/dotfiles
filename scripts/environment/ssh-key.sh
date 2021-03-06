#!/bin/bash

SERVICE_NAME=$1
AUTHOR=$2

if [[ ! -f "$HOME/.ssh/$SERVICE_NAME" ]]; then
  ssh-keygen -o -t ed25519 -f "$HOME/.ssh/$SERVICE_NAME" -C "$AUTHOR"
  ssh-add "$HOME/.ssh/$SERVICE_NAME"
else
  echo "SSH-key $SERVICE_NAME already exists."
fi
