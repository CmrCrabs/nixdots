{ config, wal, style, templateDir, ... }:
{

  xdg.configFile."matugen/config.toml".text = ''
    [config]
    variant = '${style}'
    jsonFormat = 'hex'
    type = 'scheme-tonal-spot'
    reload_apps = true
   
    [templates.kitty]
    input_path = "${templateDir}/kitty.conf"
    output_path = "${config.home.homeDirectory}/.config/kitty/colors.conf"


    [templates.hypr-colors]
    input_path = "${templateDir}/hypr.conf"
    output_path = "${config.home.homeDirectory}/.config/hypr/colors.conf"

    [config.reload_apps_list]
    kitty = true
    waybar = false
    gtk_theme = false
    dunst = false
     
    
  '';
  # home.file."kitty/colors.conf".source = "${config.programs.matugen.theme.files}/.config/kitty/colors.conf";
  # xdg.configFile."starship.toml".source = "${config.programs.matugen.theme.files}/.config/starship.toml";

  xdg.configFile."test.txt".text = ''
    ${config.programs.matugen.theme.files} 
  '';
}
