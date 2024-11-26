-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Force automatic reload
config.automatically_reload_config = true

-- Window initial settings
config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'
config.window_frame = {
  font_size = 12.0
}
config.initial_cols = 160
config.initial_rows = 35

-- Tab bar
config.enable_tab_bar = true
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.status_update_interval = 1000 

-- Color scheme
config.color_scheme = 'Nord (Gogh)'
config.bold_brightens_ansi_colors = true

-- Fonts
config.font = wezterm.font_with_fallback {
  { family = 'CaskaydiaMono Nerd Font', weight = 'Regular'},
  { family = 'IosevkaTerm Nerd Font Mono', weight = 'Regular'}
}
config.font_size = 13.0

-- Shell
local startup_dir = os.getenv("STARTUP_DIR") or os.getenv("HOME")
config.default_prog = { 'nu' }
config.default_cwd = os.getenv('STARTUP_DIR')

-- Multiplexing
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 2000 }

config.keys = {
  { key = 's', mods = 'LEADER', action = wezterm.action{SplitVertical = {domain = 'CurrentPaneDomain'}}},
  { key = 'v', mods = 'LEADER', action = wezterm.action{SplitHorizontal = {domain = 'CurrentPaneDomain'}}},
  { key = 'h', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Left' },
  { key = 'j', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Down' },
  { key = 'k', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Up' },
  { key = 'l', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Right' },
  { key = "H", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Left", 5}}},
  { key = "J", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Down", 5}}},
  { key = "K", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Up", 5}}},    
  { key = "L", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Right", 5}}},
  { key = 'd', mods = 'LEADER', action = wezterm.action{CloseCurrentPane = {confirm = true}}},
  { key = 'x', mods = 'LEADER', action = wezterm.action{CloseCurrentPane = {confirm = true}}},
}

wezterm.on('update-right-status', function(window, pane)
  local status = ''
  local status_color = '8B9BEB'

  if window:leader_is_active() then
    status = utf8.char(0x26A1)
    status_color = 'D08770'
  end

  window:set_right_status(wezterm.format({
    { Foreground = { Color = status_color } },
    { Text =  ' ' .. status .. ' '  }
  }))
end)





-- wezterm.on('gui-startup', function(cmd)  
--   local _, _, window = wezterm.mux.spawn_window{}  
  
--   -- Split the window vertically  
--   local pane1 = window:active_tab():active_pane()  
--   pane1:send_text("cd 'D:/home/'\r")  
--   --pane1:send_text("hx\r")  
  
--   -- Split pane1 horizontally  
--   local pane2 = pane1:split{direction="Right"}  
--   pane2:send_text("btop\r")  
  
--   -- Split pane1 again vertically  
--   local pane3 = pane2:split{direction="Bottom"}  
--   --pane3:send_text("python3 -m http.server\n")
-- end)

-- and finally, return the configuration to wezterm
return config
