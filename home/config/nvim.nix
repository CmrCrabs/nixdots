{ config, lib, pkgs, dotfilesDir, ...}:
{
    home.packages = with pkgs; [
    ];

    xdg.configFile = {
      nvim = {
        source = 
          config.lib.file.mkOutOfStoreSymlink
          "${config.home.homeDirectory}/${dotfilesDir}/nvim";
        recursive = true;
      };
   };
}
