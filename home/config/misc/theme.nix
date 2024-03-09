{ pkgs, ... }:
{
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 16;
    gtk.enable = true;
    x11.enable = true;
  };

  gtk = {
    enable = true;
    cursorTheme.package = pkgs.vimix-cursors;
    cursorTheme.name = "Vimix-cursors";

    iconTheme = {
      name = "WhiteSur";
      package = pkgs.whitesur-icon-theme;
    };
  };

  home.file.".icons/Vimix".source = "${pkgs.vimix-cursors}/share/icons/Vimix-cursors";
 

  # TODO: fix, it doesnt actually create the file
  home.file.".icons/default/index.theme".text = ''
    [Icon Theme]
    Inherits=Vimix-cursors
  '';
}
