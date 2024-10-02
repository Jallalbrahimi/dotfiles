-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Force automatic reload
config.automatically_reload_config = true

-- Window
config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'
config.window_frame = {
  font_size = 12.0
}
config.initial_cols = 120
config.initial_rows = 30

-- Tab bar
config.enable_tab_bar = true
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.status_update_interval = 1000 

-- Color scheme
config.color_scheme = 'TokyoNight (Gogh)'
config.bold_brightens_ansi_colors = true

-- Fonts
config.font = wezterm.font('GeistMono NF', { weight = 'Medium'})
config.font_size = 12.0

-- Shell
config.default_prog = { 'nu' }
config.default_cwd = os.getenv('HOME')

-- Multiplexing
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 2000 }

config.keys = {
  { key = 's', mods = 'LEADER', action = wezterm.action{SplitVertical = {domain = 'CurrentPaneDomain'}}},
  { key = 'v', mods = 'LEADER', action = wezterm.action{SplitHorizontal = {domain = 'CurrentPaneDomain'}}},
  { key = 'h', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Left' },
  { key = 'j', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Down' },
  { key = 'k', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Up' },
  { key = 'l', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Right' },
  { key = 'd', mods = 'LEADER', action = wezterm.action{CloseCurrentPane = {confirm = true}}},
  { key = 'x', mods = 'LEADER', action = wezterm.action{CloseCurrentPane = {confirm = true}}},
}

wezterm.on('update-right-status', function(window, pane)
  local status = ''
  local status_color = '8B9BEB'

  if window:leader_is_active() then
    status = '[LEADER]'
    status_color = 'D08770'
  end

  window:set_right_status(wezterm.format({
    { Foreground = { Color = status_color } },
    { Text =  ' ' .. status .. ' '  }
  }))
end)

-- and finally, return the configuration to wezterm
return config
