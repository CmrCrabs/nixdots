{ config, inputs, pkgs, rounding, ... }:
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

  home.file.".dotfiles/home/templates/colors.scss".text = ''
  $rounding: ${rounding}px;

  <* for name, value in colors *>
  ''${{name}}: {{value.default.hex}};
  <* endfor *>
  '';

}
