# Inherit environment from zsh (PATH, variables, etc.)
bass source ~/.zshrc 2>/dev/null

if status is-interactive
    # Initialize zoxide (smarter cd)
    zoxide init fish | source

    # Load direnv for per-project environment variables
    direnv hook fish | source

    # Replace cd with zoxide
    alias cd='z'

    # Replace grep with ripgrep
    alias grep='rg'

    # FZF configuration - Nord color scheme
    set -gx FZF_DEFAULT_OPTS "--color=bg+:#3B4252,bg:#2E3440,spinner:#81A1C1,hl:#A3BE8C,fg:#D8DEE9,header:#5E81AC,info:#EBCB8B,pointer:#88C0D0,marker:#88C0D0,fg+:#D8DEE9,prompt:#88C0D0,hl+:#A3BE8C"

    # FZF Git diff highlighter with delta
    set -g fzf_diff_highlighter "delta --color-only --features='side-by-side line-numbers'"

    # LS_COLORS with vivid (Nord theme)
    set -gx LS_COLORS (vivid generate nord)

    # Git abbreviations
    abbr -a gst git status
    abbr -a gco git checkout
    abbr -a gd git diff
    abbr -a ll ls -lah
end

# Source local secrets (not tracked in git)
if test -f ~/.config/fish/secrets.fish
    source ~/.config/fish/secrets.fish
end

# OpenClaw Completion
if test -f "$HOME/.openclaw/completions/openclaw.fish"
    source "$HOME/.openclaw/completions/openclaw.fish"
end
