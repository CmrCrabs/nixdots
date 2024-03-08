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
  

    [config.reload_apps_list]
    kitty = true
    
    
  '';
  home.file."kitty/colors.conf".source = "${config.programs.matugen.theme.files}/.config/kitty/colors.conf";

  xdg.configFile."test.txt".text = ''
    ${config.programs.matugen.theme.files} 
  '';
}
