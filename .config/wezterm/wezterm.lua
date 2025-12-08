-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.
-- Appearance
config.font = wezterm.font 'JetBrainsMono Nerd Font Mono'
config.font_size = 16
config.line_height = 1.2
config.window_background_opacity = 0.90
-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 10
config.color_scheme = 'ayu'
-- test
local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")
-- loads the state whenever I create a new workspace
wezterm.on("smart_workspace_switcher.workspace_switcher.created", function(window, path, label)
  local workspace_state = resurrect.workspace_state

  workspace_state.restore_workspace(resurrect.state_manager.load_state(label, "workspace"), {
    window = window,
    relative = true,
    restore_text = true,
    on_pane_restore = resurrect.tab_state.default_on_pane_restore,
  })
end)

-- Saves the state whenever I select a workspace
wezterm.on("smart_workspace_switcher.workspace_switcher.selected", function(window, path, label)
  local workspace_state = resurrect.workspace_state
  resurrect.state_manager.save_state(workspace_state.get_workspace_state())
end)
wezterm.on("gui-startup", resurrect.state_manager.resurrect_on_gui_startup)
---@param opts? {interval_seconds: 30}




-- Finally, return the configuration to wezterm:
return config
