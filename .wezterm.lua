-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.automatically_reload_config = true

-- For example, changing the color scheme:
config.color_scheme = 'TokyoNight (Gogh)'
config.font = wezterm.font('GeistMono NF', { weight = 'Medium'})
config.font_size = 12.0

config.bold_brightens_ansi_colors = true

config.default_prog = { 'nu' }
config.default_cwd = os.getenv("HOME")
  

config.use_fancy_tab_bar = true
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_frame = {
  font_size = 12.0
}
config.initial_cols = 120
config.initial_rows = 30

-- and finally, return the configuration to wezterm
return config
