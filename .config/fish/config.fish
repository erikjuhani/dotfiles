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

alias y "yarn"
alias v "nvim"

alias g "git"
alias gl "git log"
alias gpl "git pull --rebase"
alias gph "git push"
alias gr "git rebase"
