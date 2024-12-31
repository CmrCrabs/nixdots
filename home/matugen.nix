{ config, wal, style, rounding, transparency, transparency_hex, outer_gap, font, header_font, templateDir, obsidianDir, ... }:
{
  xdg.configFile."matugen/config.toml".text = ''
    [config]
    jsonFormat = 'hex'
    reload_apps = true

    [config.custom_keywords]
    rounding = "${rounding}"
    transparency = "${transparency}"
    transparency_hex = "${transparency_hex}"
    outer_gap = "${outer_gap}"
    font = "${font}"
    header_font = "${header_font}"

    [templates.kitty]
    input_path = "${templateDir}/kitty.conf"
    output_path = "${config.home.homeDirectory}/.config/kitty/bg_colors.conf"

    [templates.hypr-vars]
    input_path = "${templateDir}/hypr.conf"
    output_path = "${config.home.homeDirectory}/.config/hypr/vars.conf"

    [templates.obsidian]
    input_path = "${templateDir}/bg_colors.scss"
    output_path = "${obsidianDir}/.obsidian/themes/wal-matugen/scss/bg_colors.scss"

    [config.reload_apps_list]
    kitty = true
    waybar = false
    gtk_theme = true
    dunst = false

    [templates.GTK4]
    input_path = "${templateDir}/gtk-colors.css"
    output_path = "${config.home.homeDirectory}/.config/gtk-4.0/gtk.css"

    [templates.GTK3]
    input_path = "${templateDir}/gtk-colors.css"
    output_path = "${config.home.homeDirectory}/.config/gtk-3.0/gtk.css"

    [templates.ags]
    input_path = "${templateDir}/bg_colors.scss"
    output_path = "${config.home.homeDirectory}/.config/ags/scss/bg_colors.scss"
  '';

}
