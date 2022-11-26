# Github Worktree

`gw` is an utility script to make pull request reviewing a more
pleasent process. `gw` needs `gh` tool in order to work.

`gh` can be installed with brew.

```sh
brew install gh
```

First we need to create home bin folder if it doesn't already exist and add it
to the $PATH. Home directory bin is very useful as it is always attached to the
user rather than the system.

```sh
mkdir -p $HOME/bin
```

Next we just copy the script to the bin folder

```sh
cp <script_location> $HOME/bin
```
