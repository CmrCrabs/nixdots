{ config, lib, pkgs, dotfilesDir, ...}:
{

  xdg.configFile."flavours/config.toml".text = ''
  
  [[items]]
  file = "~/.config/kitty/colors.conf"
  template = "kitty"
  rewrite = true
  hook = "kill -SIGUSR1 $KITTY_PID"

  '';
}

