{ config, wal, templateDir, ... }:

{
  programs.matugen = {
    enable = true;
    variant = "dark";
    jsonFormat = "hex";
    type = "scheme-tonal-spot";
    
    templates = {
      "kitty" = {
        input_path = "${templateDir}/kitty.conf";
        output_path = "~/.config/kitty/colors.conf";
      }; 
    };
  };
  home.configFile."${templateDir}/kitty.conf".source = "${config.programs.matugen.theme.files}/.config/kitty/colors.conf";
}
