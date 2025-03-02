# WezTerm Configuration

This directory contains the configuration file for [WezTerm](https://wezfurlong.org/wezterm/), a powerful GPU-accelerated terminal emulator and multiplexer.

## Configuration File

- `.wezterm.lua` - The main configuration file for WezTerm

## Key Commands

WezTerm is configured with a leader key system (similar to tmux) for efficient terminal management. The leader key is set to **ALT + q** with a 2-second timeout.

### Leader Key Usage

To execute any of the following commands, first press the leader key (**ALT + q**), then the corresponding key.

### Tab Management

| Command          | Description                                   |
| ---------------- | --------------------------------------------- |
| `LEADER + c`     | Create a new tab in the current pane's domain |
| `LEADER + x`     | Close the current pane (with confirmation)    |
| `LEADER + b`     | Switch to the previous tab                    |
| `LEADER + n`     | Switch to the next tab                        |
| `LEADER + [0-9]` | Switch to a specific tab (0-9)                |

### Pane Splitting

| Command       | Description                                        |
| ------------- | -------------------------------------------------- |
| `LEADER + \|` | Split the current pane horizontally into two panes |
| `LEADER + -`  | Split the current pane vertically into two panes   |

### Pane Navigation

| Command      | Description                   |
| ------------ | ----------------------------- |
| `LEADER + h` | Move to the pane on the left  |
| `LEADER + j` | Move to the pane below        |
| `LEADER + k` | Move to the pane above        |
| `LEADER + l` | Move to the pane on the right |

### Pane Resizing

| Command               | Description                                    |
| --------------------- | ---------------------------------------------- |
| `LEADER + LeftArrow`  | Increase the pane size to the left by 5 units  |
| `LEADER + RightArrow` | Increase the pane size to the right by 5 units |
| `LEADER + DownArrow`  | Increase the pane size downward by 5 units     |
| `LEADER + UpArrow`    | Increase the pane size upward by 5 units       |

### Additional Keybindings

| Command            | Description                         |
| ------------------ | ----------------------------------- |
| `CTRL + SHIFT + A` | Activate QuickSelect mode           |
| `CTRL + SHIFT + O` | Toggle window background opacity    |
| `CTRL + SHIFT + E` | Toggle ligatures                    |
| `⌘ + ,`            | Open the WezTerm configuration file |

## Default WezTerm Commands (macOS)

These are important default WezTerm commands for macOS that weren't overwritten in the configuration:

### Copy & Paste

| Command                | Description                                       |
| ---------------------- | ------------------------------------------------- |
| `⌘ + c`                | Copy selected text to clipboard                   |
| `⌘ + v`                | Paste from clipboard                              |
| `CTRL + SHIFT + Space` | Enter QuickSelect mode (remapped to CTRL+SHIFT+A) |

### Font Size

| Command | Description                |
| ------- | -------------------------- |
| `⌘ + =` | Increase font size         |
| `⌘ + -` | Decrease font size         |
| `⌘ + 0` | Reset font size to default |

### Scrolling

| Command            | Description                     |
| ------------------ | ------------------------------- |
| `SHIFT + PageUp`   | Scroll up one page              |
| `SHIFT + PageDown` | Scroll down one page            |
| `⌘ + Home`         | Scroll to the top of history    |
| `⌘ + End`          | Scroll to the bottom of history |

### Search

| Command         | Description                                 |
| --------------- | ------------------------------------------- |
| `⌘ + f`         | Open search mode                            |
| `⌘ + g`         | Find next match (when search is active)     |
| `⌘ + SHIFT + g` | Find previous match (when search is active) |

### Tab Management (Default)

| Command           | Description                |
| ----------------- | -------------------------- |
| `⌘ + t`           | Create a new tab           |
| `⌘ + w`           | Close the current tab      |
| `⌘ + Tab`         | Switch to the next tab     |
| `⌘ + SHIFT + Tab` | Switch to the previous tab |
| `⌘ + [NUMBER]`    | Switch to a specific tab   |

### Window Management

| Command         | Description                      |
| --------------- | -------------------------------- |
| `⌘ + Return`    | Toggle fullscreen mode           |
| `⌘ + n`         | Create a new window              |
| `⌘ + SHIFT + z` | Toggle pane zoom (maximize pane) |

## Status Line

The status line indicates when the leader key is active by displaying an ocean wave emoji (🌊).

## Appearance Settings

- **Color Scheme**: Catppuccin Macchiato
- **Font**: MesloLGS Nerd Font Mono (size 12)
- **Background Opacity**: 0.9 (can be toggled with CTRL+SHIFT+O)
- **Window Decorations**: Resize only
- **Tab Bar**:
  - Always visible (even with only one tab)
  - Positioned at the bottom
  - Using standard (non-fancy) style
  - Zero-based tab and split indices

## Installation

To use this configuration, link or copy the `.wezterm.lua` file to your home directory:

```
ln -s /path/to/this/repo/wezterm/.wezterm.lua ~/.wezterm.lua
```

## Customization

The configuration file is well-documented with comments explaining each section. You can modify any setting to match your preferences:

- Change the color scheme
- Adjust font and size
- Customize keybindings
- Modify window appearance
- Change the tab bar behavior
