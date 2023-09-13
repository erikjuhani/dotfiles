# add the go bin path to be able to execute our programs
# set -x PATH $PATH /usr/local/go/bin $GOPATH/bin

#set -g -x PATH /usr/local/bin $PATH

# set the workspace path
# set -gx GOPATH $HOME/go
# set -gx GOROOT /usr/local/opt/go/libexec

# set node
# set -g fish_user_paths "/usr/local/opt/node/bin" $fish_user_paths

# set -x PATH $PATH /usr/local/go/bin $GOPATH/bin

# Set homebrew bin to path
set -gx PATH /opt/homebrew/bin $PATH

# Set user bin to path
set -gx PATH $HOME/bin $PATH

# Initialize the starship configuration
starship init fish | source

# Initialize zoxide and update autocomplete
zoxide init fish | source

set -g -x PATH /opt/homebrew/opt/bison/bin $PATH

set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"

alias cat "bat -p"

# Abbreviations
# TODO: Split to separate file
# source (dirname (status --current-filename))/config-abbr.fish
abbr -a v "nvim"

abbr -a y "yarn"
abbr -a yw "yarn workspace"

abbr -a g "git"
abbr -a gm "git mv"
abbr -a ga "git add"
abbr -a gc "git commit --no-verify"
abbr -a gca "git commit --amend"
abbr -a gd "git diff"
abbr -a gdo "git diff origin"
abbr -a gl "git log"
abbr -a gph "git push"
abbr -a gpl "git pull"
abbr -a gpr "git pull --rebase"
abbr -a gr "git rebase"
abbr -a gg "git grep"
abbr -a ggl "git grep -l"
abbr -a gs "git status -s -b"

abbr -a tls "tmux ls"
abbr -a tmc "tmux new -s"
abbr -a tma "tmux a -t"

abbr refr "source $HOME/.config/fish/config.fish"

function gitStatusToNvim
  gs --porcelain $argv | sed s/^...// | xargs nvim
end

alias gsv "gitStatusToNvim"

function gitGrepToNvim
  ggl $argv | xargs nvim
end

alias ggv "gitGrepToNvim"

function gitRebaseToLatest
  g checkout $argv && gpl && g switch - && gr $argv
end

alias grup "gitRebaseToLatest"

set fish_greeting

# pnpm
set -gx PNPM_HOME "$HOME/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end
set -x PATH $HOME/.shm $PATH
