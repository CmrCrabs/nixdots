{ pkgs, ... }:
{
  home.pointerCursor = {
    package = pkgs.apple-cursor;
    name = "macOS";
    size = 16;
    x11.enable = true;
    gtk.enable = true;
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "WhiteSur";
      package = pkgs.whitesur-icon-theme;
    };
    cursorTheme = {
      package = pkgs.apple-cursor;
      name = "macOS";
    }
    font = {
      name = "Jetbrains Mono Nerd Font";
      size = 11;
    }
  };

  xdg.configFile."wal/templates" = {
        source = 
          "${dotfilesDir}/home/templates";
        recursive = true;
      };
  };
}
