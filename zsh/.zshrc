export PATH="/usr/local/bin:$PATH"

# Starship
eval "$(starship init zsh)"
# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/Users/arcsule/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Go binaries
export GOPATH="/Users/arcsule/go"
export PATH="$PATH:/usr/local/go/bin"   # Add Go binary path here
export PATH="$GOPATH/bin:$PATH"

# zsh syntax
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# disable underline
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]='none'
ZSH_HIGHLIGHT_STYLES[path_prefix]='none'

# fzf
source $(brew --prefix fzf)/shell/key-bindings.zsh
source $(brew --prefix fzf)/shell/completion.zsh
export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --info=inline"


export PATH="/Users/arcsule/.local/bin:$PATH"

export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$GOENV_ROOT/shims:$PATH"
eval "$(goenv init -)"
