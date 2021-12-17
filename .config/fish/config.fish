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

# Initialize the starship configuration
starship init fish | source
set -g -x PATH /opt/homebrew/opt/bison/bin $PATH

set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

# Aliases
# TODO: Split to separate file
# source (dirname (status --current-filename))/config-alias.fish
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"

alias v "nvim"

alias y "yarn"
alias yw "y workspace"

alias g "git"
alias gm "g mv"
alias ga "g add"
alias gc "g commit --no-verify"
alias gca "gc --amend"
alias gd "g diff"
alias gdo "g diff origin"
alias gl "g log"
alias gph "g push"
alias gpl "g pull"
alias gpr "gpl --rebase"
alias gr "g rebase"
alias gg "g grep"
alias ggl "gg -l"
alias gs "g status -s -b"

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
