{ inputs, pkgs, rounding, ... }:
{
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = false;
    configDir = ../../ags;

    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk
      accountsservice
    ];
  };

  xdg.configFile."ags/scss/variables.scss".text = ''
    $rounding: ${rounding}; 
  '';
}
