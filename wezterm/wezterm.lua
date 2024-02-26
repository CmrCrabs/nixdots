return {
    enable_wayland = true,
    color_schemes = {
        ["nix-col-theme"] = require("theme"),
    },
    color_scheme = "nix-col-theme",
    cell_width = 0.9,
    default_cursor_style = "BlinkingBar",

    window_close_confirmation = "NeverPrompt",
    hide_tab_bar_if_only_one_tab = true,

    window_padding = {
        top = "1cell",
        right = "3cell",
        bottom = "1cell",
        left = "3cell",
    },

    inactive_pane_hsb = {
        saturation = 0.9,
        brightness = 0.8,
    },

    window_background_opacity = 0.4,
    text_background_opacity = 1.0,
}
