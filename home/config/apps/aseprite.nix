{ config, lib, pkgs, dotfilesDir, ...}:
{
    xdg.configFile = {
      aseprite = {
        source = 
          config.lib.file.mkOutOfStoreSymlink
          "${dotfilesDir}/aseprite";
        recursive = true;
      };
    };
}
