# Dotfiles Repository

This repository contains my personal dotfiles, terminal, and shell configurations. These configuration files are designed to customize and enhance the terminal experience with powerful tools like WezTerm, Fish shell, and Zsh shell.

## Repository Structure

- **wezterm/** - WezTerm terminal emulator configuration
- **fish/** - Fish shell configuration
- **zsh/** - Zsh shell configuration

## WezTerm Configuration

WezTerm is a GPU-accelerated cross-platform terminal emulator and multiplexer. The configuration includes customized keybindings, appearance settings, and status bar configuration.

See the [WezTerm README](./wezterm/README.MD) for detailed explanation of commands and configurations.

## Fish Shell Configuration

Fish (Friendly Interactive SHell) is a smart and user-friendly command line shell. The configuration includes:

- Path configurations for Homebrew, PNPM, and Go
- Starship prompt initialization
- Custom aliases
- goenv configuration

## Zsh Shell Configuration

Zsh is a powerful shell with advanced features. The configuration includes:

- Path configurations for various tools (NVM, PNPM, Go)
- Starship prompt integration
- Syntax highlighting and autosuggestions
- FZF (Fuzzy Finder) integration
- goenv configuration

## Installation

To use these dotfiles, you'll need to symlink or copy them to the appropriate locations on your system:

1. **WezTerm**: Link or copy `.wezterm.lua` to your home directory (`~/.wezterm.lua`)
2. **Fish**: Link or copy `config.fish` to `~/.config/fish/config.fish`
3. **Zsh**: Link or copy `.zshrc` to your home directory (`~/.zshrc`)

## Requirements

These configurations depend on several tools:

- [WezTerm](https://wezfurlong.org/wezterm/)
- [Fish shell](https://fishshell.com/)
- [Zsh shell](https://www.zsh.org/)
- [Starship prompt](https://starship.rs/)
- [NVM](https://github.com/nvm-sh/nvm) (for Zsh)
- [PNPM](https://pnpm.io/)
- [Go](https://golang.org/)
- [goenv](https://github.com/syndbg/goenv)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) (for Zsh)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) (for Zsh)
- [FZF](https://github.com/junegunn/fzf) (for Zsh)
- [MesloLGS Nerd Font Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Meslo) (for WezTerm)
