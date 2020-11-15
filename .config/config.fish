# add the go bin path to be able to execute our programs
# set -x PATH $PATH /usr/local/go/bin $GOPATH/bin

#set -g -x PATH /usr/local/bin $PATH

# set the workspace path
set -x GOPATH $HOME/go

# set node
set -g fish_user_paths "/usr/local/opt/node@14/bin" $fish_user_paths
