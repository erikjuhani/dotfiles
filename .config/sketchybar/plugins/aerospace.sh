#!/bin/sh

# The $NAME variable is passed from sketchybar and holds the name of
# the item invoking this script:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

# sketchybar --set "$NAME" label="$(cat "${HOME}/.aerospace.mode")" label.color=0xffa7c080 \
#   label.font="BlexMono Nerd Font Mono:Light:14.0"

source ./icon_map.sh

current_workspace="$(aerospace list-workspaces --focused)"

if [ "${current_workspace}" = "$1" ]; then
  # Highlight the selected workspace
  sketchybar --set "space.$1" background.color=0xff8334eb
else
  sketchybar --set "space.$1" background.color=0x22ffffff
fi

apps_in_workspace="$(aerospace list-windows --workspace "$1" | awk '{ print $3 }')"
app_amount_in_workspace="$(aerospace list-windows --workspace "$1" | wc -l | awk '{$1=$1};1')"

if [ "${app_amount_in_workspace}" -gt 1 ]; then
  for app_name in $apps_in_workspace; do
    __icon_map "${app_name}"
    icon="${icon}${icon_result}"
  done
  sketchybar --set "space.$1" icon="${icon}" label.drawing=off \
    icon.font="${font:-sketchybar-app-font:Regular:14.0}" \
    icon.y_offset=-1 \
    icon.padding_left=8 \
    icon.padding_right=8 \
    label.font="BlexMono Nerd Font Mono:Bold:12.0"
elif [ -z "${apps_in_workspace}" ]; then
  sketchybar --set "space.$1" icon.drawing=off label.drawing=on label="$1" \
    label.padding_left=4 \
    label.padding_right=4 \
    label.font="BlexMono Nerd Font Mono:Bold:12.0"
else
  # Single app
  __icon_map "${apps_in_workspace}"
  icon="${icon_result}"

  sketchybar --set "space.$1" icon="${icon}" label="${apps_in_workspace}" icon.drawing=on label.drawing=on \
    icon.padding_left=8 \
    icon.padding_right=0 \
    label.padding_right=8 \
    icon.font="${font:-sketchybar-app-font:Regular:14.0}" \
    label.font="BlexMono Nerd Font Mono:Bold:13.0"
fi
