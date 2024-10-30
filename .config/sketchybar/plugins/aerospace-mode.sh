#!/bin/sh

# The $NAME variable is passed from sketchybar and holds the name of
# the item invoking this script:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

sketchybar --set "$NAME" label="$(cat "${HOME}/.aerospace.mode")" label.color=0xffa7c080 \
  label.font="BlexMono Nerd Font Mono:Light:14.0"
