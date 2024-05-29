{ config, wal, style, rounding, transparency, templateDir, ... }:
{

  xdg.configFile."matugen/config.toml".text = ''
    [config]
    jsonFormat = 'hex'
    reload_apps = true

    [config.custom_keywords]
    rounding = "${rounding}"
    transparency = "${transparency}"

    [templates.kitty]
    input_path = "${templateDir}/kitty.conf"
    output_path = "${config.home.homeDirectory}/.config/kitty/bg_colors.conf"

    [templates.hypr-colors]
    input_path = "${templateDir}/hypr.conf"
    output_path = "${config.home.homeDirectory}/.config/hypr/colors.conf"

    [config.reload_apps_list]
    kitty = true
    waybar = false
    gtk_theme = false
    dunst = false

    [templates.GTK4]
    input_path = "${templateDir}/gtk.css"
    output_path = "${config.home.homeDirectory}/.config/gtk-4.0/gtk.css"

    [templates.GTK3]
    input_path = "${templateDir}/gtk.css"
    output_path = "${config.home.homeDirectory}/.config/gtk-3.0/gtk.css"

    [templates.ags]
    input_path = "${templateDir}/bg_colors.scss"
    output_path = "${config.home.homeDirectory}/.config/ags/scss/bg_colors.scss"


    
  '';

}
