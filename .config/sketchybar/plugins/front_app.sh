#!/bin/sh

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

if [ "$SENDER" = "front_app_switched" ]; then
  case "${INFO}" in
    Alacritty) icon="" ;;
    Firefox) icon="󰈹" ;;
    Obsidian) icon="" ;;
    Slack) icon="" ;;
    "System Settings") icon="" ;;
  esac
  sketchybar --set "$NAME" icon="${icon}" label="$INFO" \
    icon.font="BlexMono Nerd Font Mono:Regular:20.0" \
    label.font="BlexMono Nerd Font Mono:Bold:12.0"
fi
