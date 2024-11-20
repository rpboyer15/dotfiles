-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 17

-- config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.window_decorations = "RESIZE"

config.window_background_opacity = 0.9
config.macos_window_background_blur = 30

-- and finally, return the configuration to wezterm
return config
