local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()
local window_background_opacity = 0.9
local default_wsl_distribution = "Ubuntu-24.04"
local keybind_help = {
  { key = "F1", desc = "Open this keybind help overlay" },
  { key = "Alt+q", desc = "Leader key. Press this first, then the next key within 2 seconds" },
  { key = "Ctrl+A", desc = "Quick Select mode" },
  { key = "Ctrl+O", desc = "Toggle window background opacity" },
  { key = "Ctrl+E", desc = "Toggle ligatures on and off" },
  { key = "Ctrl+,", desc = "Open the WezTerm config file in a new window" },
  { key = "Alt+q then c", desc = "Open a new tab in the current shell" },
  { key = "Alt+q then w", desc = "Open a new Windows PowerShell tab" },
  { key = "Alt+q then x", desc = "Close the current pane with confirmation" },
  { key = "Alt+q then b", desc = "Go to the previous tab" },
  { key = "Alt+q then n", desc = "Go to the next tab" },
  { key = "Alt+q then 0-9", desc = "Jump directly to tab 0 through 9" },
  { key = "Alt+q then \\", desc = "Split the current pane side by side" },
  { key = "Alt+q then -", desc = "Split the current pane vertically" },
  { key = "Alt+q then h", desc = "Move to the pane on the left" },
  { key = "Alt+q then j", desc = "Move to the pane below" },
  { key = "Alt+q then k", desc = "Move to the pane above" },
  { key = "Alt+q then l", desc = "Move to the pane on the right" },
  { key = "Alt+q then Left", desc = "Make the current pane wider to the left" },
  { key = "Alt+q then Right", desc = "Make the current pane wider to the right" },
  { key = "Alt+q then Up", desc = "Make the current pane taller upward" },
  { key = "Alt+q then Down", desc = "Make the current pane taller downward" },
  { key = "Ctrl+Shift+C", desc = "Copy to clipboard" },
  { key = "Ctrl+V", desc = "Paste from clipboard" },
  { key = "Ctrl+T", desc = "Open a new tab" },
  { key = "Ctrl+W", desc = "Close the current tab" },
  { key = "Ctrl+Tab", desc = "Go to the next tab" },
  { key = "Ctrl+Shift+Tab", desc = "Go to the previous tab" },
  { key = "Ctrl+P", desc = "Open the command palette" },
  { key = "Ctrl+R", desc = "Reload the WezTerm config" },
  { key = "Ctrl+F", desc = "Search in the current terminal scrollback" },
  { key = "Alt+Enter", desc = "Toggle fullscreen" },
}

-- ===================================================
-- Leader Key:
-- The leader key is set to ALT + q, with a timeout of 2000 milliseconds (2 seconds).
-- To execute any keybinding, press the leader key (ALT + q) first, then the corresponding key.

-- Keybindings:
-- 1. Tab Management:
--    - LEADER + c: Create a new tab in the current pane's domain.
--    - LEADER + x: Close the current pane (with confirmation).
--    - LEADER + b: Switch to the previous tab.
--    - LEADER + n: Switch to the next tab.
--    - LEADER + <number>: Switch to a specific tab (0-9).

-- 2. Pane Splitting:
--    - LEADER + |: Split the current pane horizontally into two panes.
--    - LEADER + -: Split the current pane vertically into two panes.

-- 3. Pane Navigation:
--    - LEADER + h: Move to the pane on the left.
--    - LEADER + j: Move to the pane below.
--    - LEADER + k: Move to the pane above.
--    - LEADER + l: Move to the pane on the right.

-- 4. Pane Resizing:
--    - LEADER + LeftArrow: Increase the pane size to the left by 5 units.
--    - LEADER + RightArrow: Increase the pane size to the right by 5 units.
--    - LEADER + DownArrow: Increase the pane size downward by 5 units.
--    - LEADER + UpArrow: Increase the pane size upward by 5 units.

-- 5. Status Line:
--    - The status line indicates when the leader key is active, displaying an ocean wave emoji.

-- 6. Local Windows Shell:
--    - LEADER + w: Open a new Windows tab in the local domain.
-- 7. Keybind Help:
--    - F1: Open an overlay listing key assignments.

-- Appearance
config.window_background_opacity = window_background_opacity
config.window_decorations = "RESIZE"
config.font = wezterm.font_with_fallback({
  "JetBrains Mono",
  "Symbols Nerd Font Mono",
})
config.color_scheme = "Catppuccin Macchiato"
config.font_size = 12

-- Start in WSL by default. Use a WSL domain (not default_prog) so that
-- SpawnTab("CurrentPaneDomain") inherits the current pane's CWD via OSC 7
-- instead of launching wsl.exe fresh and overwriting it.
config.wsl_domains = {
  {
    name = "WSL:" .. default_wsl_distribution,
    distribution = default_wsl_distribution,
    default_cwd = "~",
  },
}
config.default_domain = "WSL:" .. default_wsl_distribution
config.launch_menu = {
  { label = "Ubuntu-24.04 (WSL)", domain = { DomainName = "WSL:" .. default_wsl_distribution } },
  { label = "PowerShell", args = { "powershell.exe", "-NoLogo" } },
  { label = "Command Prompt", args = { "cmd.exe" } },
}

-- tab bar
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true

-- Utility functions
local function toggle_window_background_opacity(window)
  local overrides = window:get_config_overrides() or {}
  if not overrides.window_background_opacity then
    overrides.window_background_opacity = 1.0
  else
    overrides.window_background_opacity = nil
  end
  window:set_config_overrides(overrides)
end
wezterm.on("toggle-window-background-opacity", toggle_window_background_opacity)

local function toggle_ligatures(window)
  local overrides = window:get_config_overrides() or {}
  if not overrides.harfbuzz_features then
    overrides.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
  else
    overrides.harfbuzz_features = nil
  end
  window:set_config_overrides(overrides)
end
wezterm.on("toggle-ligatures", toggle_ligatures)
local function show_keybind_help(window, pane)
  local choices = {}
  for _, item in ipairs(keybind_help) do
    table.insert(choices, {
      id = item.key,
      label = string.format("%-22s  %s", item.key, item.desc),
    })
  end

  window:perform_action(
    act.InputSelector({
      title = "WezTerm Keybinds",
      description = "Search or scroll to see your keybinds. Enter closes the overlay.",
      fuzzy = true,
      choices = choices,
      action = wezterm.action_callback(function(inner_window, _, _, label)
        if label then
          inner_window:toast_notification("WezTerm Keybinds", label, nil, 2500)
        end
      end),
    }),
    pane
  )
end

-- Keybindings
config.leader = { key = "q", mods = "ALT", timeout_milliseconds = 2000 }
config.keys = {
  -- Default QuickSelect keybind (CTRL-SHIFT-Space) gets captured by something
  -- else on my system
  {
    key = "a",
    mods = "CTRL",
    action = act.QuickSelect,
  },
  {
    key = "o",
    mods = "CTRL",
    action = act.EmitEvent("toggle-window-background-opacity"),
  },
  {
    key = "e",
    mods = "CTRL",
    action = act.EmitEvent("toggle-ligatures"),
  },
  {
    key = "F1",
    action = wezterm.action_callback(show_keybind_help),
  },
  {
    key = ",",
    mods = "CTRL",
    action = act.SpawnCommandInNewWindow({
      cwd = os.getenv("WEZTERM_CONFIG_DIR"),
      args = { "powershell.exe", "-NoLogo", "-Command", "$env:VISUAL $env:WEZTERM_CONFIG_FILE" },
    }),
  },
  {
    key = "t",
    mods = "CTRL",
    action = act.SpawnTab("CurrentPaneDomain"),
  },
  {
    key = "w",
    mods = "CTRL",
    action = act.CloseCurrentTab({ confirm = true }),
  },
  {
    key = "p",
    mods = "CTRL",
    action = act.ActivateCommandPalette,
  },
  {
    key = "r",
    mods = "CTRL",
    action = act.ReloadConfiguration,
  },
  {
    key = "f",
    mods = "CTRL",
    action = act.Search("CurrentSelectionOrEmptyString"),
  },
  {
    key = "v",
    mods = "CTRL",
    action = act.PasteFrom("Clipboard"),
  },
  {
    mods = "LEADER",
    key = "c",
    action = act.SpawnTab("CurrentPaneDomain"),
  },
  {
    mods = "LEADER",
    key = "w",
    action = act.SpawnCommandInNewTab({
      args = { "powershell.exe", "-NoLogo" },
    }),
  },
  {
    mods = "LEADER",
    key = "x",
    action = act.CloseCurrentPane({ confirm = true }),
  },
  {
    mods = "LEADER",
    key = "b",
    action = act.ActivateTabRelative(-1),
  },
  {
    mods = "LEADER",
    key = "n",
    action = act.ActivateTabRelative(1),
  },
  {
    mods = "LEADER",
    key = "\\",
    action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    mods = "LEADER",
    key = "-",
    action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  {
    mods = "LEADER",
    key = "h",
    action = act.ActivatePaneDirection("Left"),
  },
  {
    mods = "LEADER",
    key = "j",
    action = act.ActivatePaneDirection("Down"),
  },
  {
    mods = "LEADER",
    key = "k",
    action = act.ActivatePaneDirection("Up"),
  },
  {
    mods = "LEADER",
    key = "l",
    action = act.ActivatePaneDirection("Right"),
  },
  {
    mods = "LEADER",
    key = "LeftArrow",
    action = act.AdjustPaneSize({ "Left", 5 }),
  },
  {
    mods = "LEADER",
    key = "RightArrow",
    action = act.AdjustPaneSize({ "Right", 5 }),
  },
  {
    mods = "LEADER",
    key = "DownArrow",
    action = act.AdjustPaneSize({ "Down", 5 }),
  },
  {
    mods = "LEADER",
    key = "UpArrow",
    action = act.AdjustPaneSize({ "Up", 5 }),
  },
}

for i = 0, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = "LEADER",
    action = act.ActivateTab(i),
  })
end

wezterm.on("update-right-status", function(window, _)
  local solid_left_arrow = ""
  local arrow_foreground = { Foreground = { Color = "#c6a0f6" } }
  local prefix = ""

  if window:leader_is_active() then
    prefix = " " .. utf8.char(0x1F30A)
    solid_left_arrow = utf8.char(0xE0B2)
  end

  if window:active_tab():tab_id() ~= 0 then
    arrow_foreground = { Foreground = { Color = "#1e2030" } }
  end

  window:set_left_status(wezterm.format({
    { Background = { Color = "#b7bdf8" } },
    { Text = prefix },
    arrow_foreground,
    { Text = solid_left_arrow },
  }))
end)

return config
