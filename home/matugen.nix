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
        output_path = "${config.home.homeDirectory}/.config/kitty/colors.conf";
      }; 
    };
  };
  home.file."kitty/colors.conf".source = "${config.programs.matugen.theme.files}/.config/kitty/colors.conf";

  xdg.configFile."test.txt".text = ''
    ${config.programs.matugen.theme.files} 
  '';
}
