{ pkgs, ... }:
{
  home.pointerCursor = {
    package = pkgs.apple-cursor;
    name = "macOS-BigSur";
    size = 16;
    x11.enable = true;
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "WhiteSur";
      package = pkgs.whitesur-icon-theme;
    };
  };
}
