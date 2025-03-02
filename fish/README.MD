# Fish Shell Configuration

This directory contains the configuration file for [Fish](https://fishshell.com/), a smart and user-friendly command line shell.

## Configuration File

- `config.fish` - The main configuration file for Fish shell

## Configuration Details

The Fish configuration includes the following settings:

### Shell Behavior

- Removes the default Fish greeting message

### Path Configurations

- Adds Homebrew binaries to the PATH (`/usr/local/bin`)
- Adds PNPM binaries to the PATH (`/Users/arcsule/Library/pnpm`)
- Configures Go environment:
  - Sets GOPATH to `/Users/arcsule/go`
  - Adds Go binaries to PATH
- Configures goenv:
  - Sets GOENV_ROOT to `$HOME/.goenv`
  - Adds goenv binaries to PATH
  - Initializes goenv
  - Adds goenv shims to PATH

### Prompt

- Initializes [Starship](https://starship.rs/) prompt

### Aliases

- `proj` - Shortcut to navigate to `~/Documents/projects`

## Installation

To use this configuration, link or copy the `config.fish` file to your Fish configuration directory:

```
mkdir -p ~/.config/fish
ln -s /path/to/this/repo/fish/config.fish ~/.config/fish/config.fish
```

## Requirements

- [Fish shell](https://fishshell.com/)
- [Homebrew](https://brew.sh/) (for macOS)
- [Starship](https://starship.rs/)
- [PNPM](https://pnpm.io/) (if you use Node.js)
- [Go](https://golang.org/) (if you use Go)
- [goenv](https://github.com/syndbg/goenv) (for Go version management)

## Customization

You can customize this configuration by editing the `config.fish` file:

- Add your own aliases
- Configure additional environment variables
- Add more paths to the PATH variable
- Change the prompt configuration
