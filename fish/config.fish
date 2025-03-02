# remove greeting 
set -g fish_greeting ""

# Add Homebrew to PATH
set -U fish_user_paths /usr/local/bin $fish_user_paths

# Add PNPM binaries
set -U fish_user_paths /Users/arcsule/Library/pnpm $fish_user_paths

# Add Go binaries
set -x GOPATH /Users/arcsule/go
set -U fish_user_paths /usr/local/go/bin $GOPATH/bin $fish_user_paths

# Initialize Starship
starship init fish | source

alias proj='cd ~/Documents/projects'

set -Ux GOENV_ROOT $HOME/.goenv
set -Ux PATH $GOENV_ROOT/bin $PATH
status --is-interactive; and source (goenv init -|psub)
set -Ux PATH $GOENV_ROOT/shims $PATH
