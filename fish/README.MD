# Fish Shell Configuration

Primary shell. Configuration includes:

- **zoxide** for smart directory navigation (`cd` aliased to `z`)
- **fnm** for Node version management
- **ripgrep** aliased as `grep`
- **fzf** with Nord color scheme and delta integration
- **vivid** for LS_COLORS (Nord theme)
- Git abbreviations (`gst`, `gco`, `gd`, `ll`)

## Secrets

API keys are loaded from `~/.config/fish/secrets.fish` (not tracked in git). Create this file locally:

```fish
set -gx MY_API_KEY "your-key-here"
```

## Requirements

- [Fish shell](https://fishshell.com/)
- [bass](https://github.com/edc/bass) (sources zsh from fish)
- [fnm](https://github.com/Schniz/fnm)
- [zoxide](https://github.com/ajeetdsouza/zoxide)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fzf](https://github.com/junegunn/fzf)
- [delta](https://github.com/dandavella/delta)
- [vivid](https://github.com/sharkdp/vivid)
