#!/bin/sh

# The $NAME variable is passed from sketchybar and holds the name of
# the item invoking this script:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

# sketchybar --set "$NAME" label="$(cat "${HOME}/.aerospace.mode")" label.color=0xffa7c080 \
#   label.font="BlexMono Nerd Font Mono:Light:14.0"

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set "$NAME" background.drawing=on \
    label.font="BlexMono Nerd Font Mono:Regular:12.0"
else
  sketchybar --set "$NAME" background.drawing=off \
    label.font="BlexMono Nerd Font Mono:Regular:12.0"
fi
