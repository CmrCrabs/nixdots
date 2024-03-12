{ config, lib, pkgs, ...}:
{
    home.packages = with pkgs; [
    ];

    xdg.configFile = {
      nvim = {
        source = 
          config.lib.file.mkOutOfStoreSymlink
          "${config.home.homeDirectory}/.dotfiles/nvim";
        recursive = true;
      };
   };
}
