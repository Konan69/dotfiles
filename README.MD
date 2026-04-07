# Dotfiles

Personal dotfiles for terminal and shell configuration.

## Structure

- **ghostty/** - Ghostty terminal emulator configuration (active)
- **fish/** - Fish shell configuration (active, primary shell)
- **zsh/** - Zsh shell configuration (active, sourced by fish for PATH)
- **wezterm/** - WezTerm terminal emulator configuration (archived)
- **starship/** - Starship prompt configuration (archived)

## Current Stack

- **Terminal**: [Ghostty](https://ghostty.org/) with Nord theme
- **Shell**: [Fish](https://fishshell.com/) (primary), Zsh (PATH bootstrap)
- **Node**: [fnm](https://github.com/Schniz/fnm)
- **Runtime**: [Bun](https://bun.sh/)
- **CLI tools**: [zoxide](https://github.com/ajeetdsouza/zoxide), [ripgrep](https://github.com/BurntSushi/ripgrep), [fzf](https://github.com/junegunn/fzf), [delta](https://github.com/dandavella/delta), [vivid](https://github.com/sharkdp/vivid)

## Installation

```sh
# Fish
ln -sf /path/to/dotfiles/fish/config.fish ~/.config/fish/config.fish

# Ghostty
ln -sf /path/to/dotfiles/ghostty/config ~/.config/ghostty/config

# Zsh
ln -sf /path/to/dotfiles/zsh/.zshrc ~/.zshrc
```

## Secrets

API keys and tokens are sourced from `~/.config/fish/secrets.fish` (not tracked).
