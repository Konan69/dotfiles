# Emit OSC 7 so WezTerm tracks the CWD; new tabs/panes inherit it.
function __wezterm_osc7 --on-variable PWD --on-event fish_prompt
    printf "\033]7;file://%s%s\033\\" (hostname) (string replace -a " " "%20" -- $PWD)
end
