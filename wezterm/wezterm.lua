local wezterm = require("wezterm");
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.enable_wayland = false
config.default_prog = { "fish" }

config.color_schemes = {
  ["nix-col-theme"] = require("theme")
}
config.color_scheme = "nix-col-theme"
config.cell_width = 0.9
config.default_cursor_style = "BlinkingBar"

config.window_close_confirmation = "NeverPrompt"
config.hide_tab_bar_if_only_one_tab = true

config.window_padding = {
  top = "1cell",
  right = "3cell",
  bottom = "1cell",
  left = "3cell",
}

config.inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.8,
}
config.window_background_opacity = 0.4
config.text_background_opacity = 1.0

return config
