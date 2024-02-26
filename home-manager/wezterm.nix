{ pkgs, config, inputs,  ... }: 
{
  programs.wezterm = {
    enable = true;
  };
  xdg.configFile.wezterm.source = ../wezterm;

  xdg.configFile."wezterm/theme.lua".text = ''
    return {
      [colors]
      foreground    = "${config.colorScheme.palette.base05}"
      background    = "${config.colorScheme.palette.base00}"
      cursor_bg     = "${config.colorScheme.palette.base05}"
      cursor_border = "${config.colorScheme.palette.base05}"
      cursor_fg     = "${config.colorScheme.palette.base00}"
      selection_bg  = "${config.colorScheme.palette.base05}"
      selection_fg  = "${config.colorScheme.palette.base00}"
      
      ansi = [
        "${config.colorScheme.palette.base00}",
        "${config.colorScheme.palette.base08}",
        "${config.colorScheme.palette.base0B}",
        "${config.colorScheme.palette.base0A}",
        "${config.colorScheme.palette.base0D}",
        "${config.colorScheme.palette.base0E}",
        "${config.colorScheme.palette.base0C}",
        "${config.colorScheme.palette.base05}"
      ]
      
      brights = [
        "${config.colorScheme.palette.base03}",
        "${config.colorScheme.palette.base08}",
        "${config.colorScheme.palette.base0B}",
        "${config.colorScheme.palette.base0A}",
        "${config.colorScheme.palette.base0D}",
        "${config.colorScheme.palette.base0E}",
        "${config.colorScheme.palette.base0C}",
        "${config.colorScheme.palette.base07}"
      ] 
  '';
}
