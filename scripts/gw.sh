#!/usr/bin/env sh

REQUIRED_DEPENDENCIES=(
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

args=("$@")

help_message() {
  echo "gw: checkout pull requests to worktrees"
  echo "Usage:"
  echo "\tgw open <branch_name>\tAdds a new local worktree from PR"
  echo "\tgw done [<branch_name>]\tRemoves current worktree or by provided branch name"
  echo "\tgw list\t\t\tLists all worktrees"
}

if [ -z "${args[0]}" ]; then
  help_message
  exit 2
fi

asserts_branch_name() {
  if [ -z "$1" ]; then
    echo "branch name was not provided"
    exit 1
  fi
}

checkout_pr_to_worktree() {
  asserts_branch_name "$1"
  pr_refs=($(gh pr list -s all --jq=.[].headRefName --json headRefName))
  for ref in "${pr_refs[@]}"
  do
    echo $ref
    if [ "$1" == "$ref" ]; then
      found=true
      break
    fi
  done

  if [ -z "$found" ]; then
    echo "$1 not found in remote"
  else
    echo "$1 found in remote"
  fi

  root="$(git rev-parse --show-toplevel)"
  # Use a hidden .git-worktrees directory for worktrees
  dir="$root/.git-worktrees/$1"
  remote="origin"

  git worktree add -B "$1" "$dir" "$remote/$1"

  cd "$dir"
}

# first iteration is only for yarn
initialize_worktree() {
  # check for yarn.lock
  root="$(git rev-parse --show-toplevel)"
  has_yarn_lock=$(find "$root/yarn.lock" 2> /dev/null)
  if [ ! -z "$has_yarn_lock" ] && command_exists yarn; then
    yarn
  fi
}

remove_worktree() {
  worktree_dir="$1"
  if [ -z "$worktree_dir" ]; then
    worktree_dir="$(git rev-parse --show-toplevel)"
  fi
  git worktree remove -f $worktree_dir
}

list_worktrees() {
  root="$(git rev-parse --show-toplevel)/.git-worktrees"
  length="${#root}"
  worktree_list=($(git worktree list --porcelain | grep '.git-worktrees' | awk '{ print $2 }'))
  for worktree in "${worktree_list[@]}"
  do
    echo "${worktree:$length}"
  done
}

case "${args[0]}" in
list)
    list_worktrees
    ;;
open)
    checkout_pr_to_worktree "${args[1]}"
    initialize_worktree
    ;;
done)
    remove_worktree "${args[1]}"
    ;;
esac
