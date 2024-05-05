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
}
