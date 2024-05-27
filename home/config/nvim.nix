{ config, lib, pkgs, dotfilesDir, ...}:
{
    home.packages = with pkgs; [
    ];

    xdg.configFile = {
      nvim = {
        source = 
          config.lib.file.mkOutOfStoreSymlink
          "${dotfilesDir}/nvim";
        recursive = true;
      };
    };
    home.file."${dotfilesDir}/nvim/lua/colorscheme.lua".text = with config.colorScheme.palette; ''
    return {
        base00 = "#${base00}",
        base01 = "#${base01}",
        base02 = "#${base02}",
        base03 = "#${base03}",
        base04 = "#${base04}",
        base05 = "#${base05}",
        base06 = "#${base06}",
        base07 = "#${base07}",
        base08 = "#${base08}",
        base09 = "#${base09}",
        base0A = "#${base0A}",
        base0B = "#${base0B}",
        base0C = "#${base0C}",
        base0D = "#${base0D}",
        base0E = "#${base0E}",
        base0F = "#${base0F}",
    }
    '';
}
