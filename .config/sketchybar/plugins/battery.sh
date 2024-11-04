#!/bin/sh

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

case "${PERCENTAGE}" in
  9[0-9] | 100) icon="" ;;
  [6-8][0-9]) icon="" ;;
  [3-5][0-9]) icon="" ;;
  [1-2][0-9]) icon="" ;;
  *) icon="" ;;
esac

# if [[ "$CHARGING" != "" ]]; then
#   icon=""
#   icon_size="14.0"
# fi

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status

sketchybar --set "$NAME" icon="$icon" label="${PERCENTAGE}%" icon.drawing=on label.drawing=off \
  label.font="BlexMono Nerd Font Mono:Bold:12.0" \
  icon.font="BlexMono Nerd Font Mono:Regular:${icon_size:-36.0}" \
  click_script="sketchybar --set $NAME icon.drawing=toggle label.drawing=toggle"
