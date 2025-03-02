# Zsh Shell Configuration

This directory contains the configuration file for [Zsh](https://www.zsh.org/), a powerful shell with advanced features.

## Configuration File

- `.zshrc` - The main configuration file for Zsh shell

## Configuration Details

The Zsh configuration includes the following settings:

### Path Configurations

- Adds `/usr/local/bin` to the PATH
- Adds PNPM binaries to the PATH (`/Users/arcsule/Library/pnpm`)
- Configures local binaries (`~/.local/bin`)
- Configures Go environment:
  - Sets GOPATH to `/Users/arcsule/go`
  - Adds Go binaries to PATH
- Configures goenv:
  - Sets GOENV_ROOT to `$HOME/.goenv`
  - Adds goenv binaries and shims to PATH
  - Initializes goenv

### Tool Integrations

- **Starship**: Initializes [Starship](https://starship.rs/) prompt
- **NVM**: Configures Node Version Manager
  - Loads NVM
  - Loads NVM bash completion
- **FZF**: Integrates [Fuzzy Finder](https://github.com/junegunn/fzf)
  - Configures key bindings and completion
  - Sets default options (height, layout, info display)

### Syntax Enhancement

- **zsh-syntax-highlighting**: Adds syntax highlighting to commands
  - Disables underlines for paths
- **zsh-autosuggestions**: Provides autosuggestions based on command history

## Installation

To use this configuration, link or copy the `.zshrc` file to your home directory:

```
ln -s /path/to/this/repo/zsh/.zshrc ~/.zshrc
```

## Requirements

- [Zsh shell](https://www.zsh.org/)
- [Homebrew](https://brew.sh/) (for macOS)
- [Starship](https://starship.rs/)
- [NVM](https://github.com/nvm-sh/nvm) (if you use Node.js)
- [PNPM](https://pnpm.io/) (if you use Node.js)
- [Go](https://golang.org/) (if you use Go)
- [goenv](https://github.com/syndbg/goenv) (for Go version management)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [FZF](https://github.com/junegunn/fzf)

## Customization

You can customize this configuration by editing the `.zshrc` file:

- Add your own aliases
- Configure additional environment variables
- Add more tools and integrations
- Change syntax highlighting options
- Adjust FZF settings
