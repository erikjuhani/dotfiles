#!/bin/sh

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

source ./icon_map.sh

__icon_map "${INFO}"
icon="${icon_result}"

if [ "$SENDER" = "front_app_switched" ]; then
  sketchybar --set "$NAME" icon="${icon}" label="${INFO}" \
    icon.font="${font:-sketchybar-app-font:Regular:14.0}" \
    icon.y_offset=-1 \
    label.font="BlexMono Nerd Font Mono:Bold:12.0"
fi
