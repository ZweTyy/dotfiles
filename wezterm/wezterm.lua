-- Pull in the wezterm API
local wezterm = require "wezterm"

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- Font
config.font = wezterm.font("MesloLGS NF")
config.font_size = 16.0
-- Enable tab bar
-- config.hide_tab_bar_if_only_one_tab = false
config.enable_tab_bar = false

-- Window decorations
config.window_decorations = "RESIZE"

-- Color scheme
config.color_scheme = "tokyonight_moon"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 10

-- Configuring Mac Option key
config.send_composed_key_when_left_alt_is_pressed = true

-- Window Background Image
-- config.window_background_image = '/Users/tandang/Pictures/gojo.png'

-- config.window_background_image_hsb = {

--     brightness = 0.1,
--     hue = 1.0,
--     saturation = 1.0,
-- }


-- and finally, return the configuration to wezterm
return config
