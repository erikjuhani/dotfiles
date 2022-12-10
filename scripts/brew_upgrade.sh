#!/usr/bin/env sh

REQUIRED_DEPENDENCIES=(
  brew
  gum
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

iterate_required_dependencies() {
  exit_code=0
  arr=($@)
  for item in "${arr[@]}"
  do
    if ! command_exists $item; then
      echo "required dependency \"${item}\" does not exist"
      exit_code=1
    fi
  done

  return $exit_code
}

iterate_required_dependencies "${REQUIRED_DEPENDENCIES[@]}"

selected_for_upgrade="$(gum spin --show-output -- brew outdated --json | jq '[.formulae[] | [.name,(.installed_versions[0]),("-> "+.current_version)]] | .[] | join(" ")' -r | gum filter --no-limit)"

if [ ! ${#selected_for_upgrade[@]} -eq 0 ]; then
  arr=()
  for item in "${selected_for_upgrade[@]}"
  do
    arr+=($(echo "${item}" | awk '{print $1}'))
  done
  gum join --align=left --vertical "Selected for upgrade" "$(gum style --border=normal --padding="1 2" "$selected_for_upgrade")"
  gum confirm --affirmative="Confirm" --negative="Cancel"
  echo "$(gum spin --show-output --title "Upgrading packages..." -- brew upgrade -q "${arr[@]}")"
fi

exit 0
