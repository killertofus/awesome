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
local resurrect = require 'resurrect/config'
config.keys = merge.all(config.keys, resurrect.keys)
-- Finally, return the configuration to wezterm:
return config
