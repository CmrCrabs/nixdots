{ config, lib, pkgs, dotfilesDir, ...}:
{

  xdg.configFile."flavours/config.toml".text = ''
  
  [[items]]
  file = "~/.config/kitty/colors.conf"
  template = "kitty"
  rewrite = true

  '';
}

