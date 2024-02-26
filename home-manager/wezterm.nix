{ pkgs, config, inputs, ... }: 
{
  programs.wezterm = {
    enable = true;
  };
  xdg.configFile.wezterm.source = ../wezterm;

  xdg.configFile."wezterm/theme.lua".text = ''
    return {
      [colors]
      foreground    = "${config.colourScheme.palette.base05}"
      background    = "${config.colourScheme.palette.base00}"
      cursor_bg     = "${config.colourScheme.palette.base05}"
      cursor_border = "${config.colourScheme.palette.base05}"
      cursor_fg     = "${config.colourScheme.palette.base00}"
      selection_bg  = "${config.colourScheme.palette.base05}"
      selection_fg  = "${config.colourScheme.palette.base00}"
      
      ansi = [
        "${config.colourScheme.palette.base00}",
        "${config.colourScheme.palette.base08}",
        "${config.colourScheme.palette.base0B}",
        "${config.colourScheme.palette.base0A}",
        "${config.colourScheme.palette.base0D}",
        "${config.colourScheme.palette.base0E}",
        "${config.colourScheme.palette.base0C}",
        "${config.colourScheme.palette.base05}"
      ]
      
      brights = [
        "${config.colourScheme.palette.base03}",
        "${config.colourScheme.palette.base08}",
        "${config.colourScheme.palette.base0B}",
        "${config.colourScheme.palette.base0A}",
        "${config.colourScheme.palette.base0D}",
        "${config.colourScheme.palette.base0E}",
        "${config.colourScheme.palette.base0C}",
        "${config.colourScheme.palette.base07}"
      ] 
  '';
}
