#!/usr/bin/env sh

REQUIRED_DEPENDENCIES=(
  gh
)

############################
# TRACE AND ERROR HANDLING #
############################

set -e

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
  arr=($@)
  for item in "${arr[@]}"
  do
    if ! command_exists $item; then
      echo "required dependency \"${item}\" does not exist"
      return 1
    fi
  done
}

iterate_required_dependencies "${REQUIRED_DEPENDENCIES[@]}"

args=("$@")

help_message() {
  echo "gw: checkout pull requests to worktrees"
  echo "Usage:"
  echo "\tgw open <branch_name>\t\tAdds a new local worktree from PR"
  echo "\tgw done [<branch_name>]\t\tRemoves current worktree or by provided branch name"
  echo "\tgw list\t\t\t\tLists all worktrees"
  echo "\tgw find [requested | by <who>]\tReturns a list of pull requests"
}

if [ -z "${args[0]}" ]; then
  help_message
  exit 2
fi

assert() {
  if [ -z "$1" ]; then
    if [ ! -z "$2" ]; then
      echo "$2"
    fi
    exit 1
  fi
}

find_pr() {
  case "$1" in
  requested)
      search="--search user-review-requested:@me"
      ;;
  by)
      search="--search author:$2"
      ;;
  esac

  result="$(gh pr list -s all --jq=.[].headRefName --json headRefName $search)"
  if [ ! -z "$result" ]; then
    echo "$result"
  fi
}

pr_to_worktree() {
  assert "$1" "branch name was not provided"

  pr_refs=($(find_pr))
  for ref in "${pr_refs[@]}"
  do
    if [ "$1" == "$ref" ]; then
      found=true
      break
    fi
  done

  root="$(git rev-parse --show-toplevel)"
  # Use a hidden .git-worktrees directory for worktrees
  dir="$root/.git-worktrees/$1"
  remote="origin"

  if ! worktree_exists "$1"; then
    git worktree add -B "$1" "$dir" "$remote/$1"
    echo "\nCall to change to worktree in current shell:"
    echo "cd $dir"
  fi
}

# first iteration is only for yarn
init_worktree() {
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
  if git worktree remove -f $worktree_dir; then
    echo "worktree \"$worktree_dir\" was removed"
  fi
}

list_worktrees() {
  root="$(git rev-parse --show-toplevel)/.git-worktrees"
  length="${#root}"
  worktree_list=($(git worktree list --porcelain | grep '.git-worktrees' | awk '{ print $2 }'))
  for worktree in "${worktree_list[@]}"
  do
    echo "${worktree:$length+1}"
  done
}

worktree_exists() {
  arr=($(list_worktrees))
  for worktree in "${arr[@]}"
  do
    if [ "$worktree" == "$1" ]; then
      return 0
    fi
  done

  return 1
}

case "${args[0]}" in
find)
    find_pr "${args[1]}" "${args[2]}"
    ;;
open)
    pr_to_worktree "${args[1]}"
    init_worktree
    ;;
list)
    list_worktrees
    ;;
done)
    remove_worktree "${args[1]}"
    ;;
esac
