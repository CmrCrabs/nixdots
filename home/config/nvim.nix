{ config, lib, pkgs, dotfilesDir, ...}:
{
    home.packages = with pkgs; [
        lua-language-server
        nodePackages_latest.typescript-language-server
        rust-analyzer
        vimPlugins.omnisharp-extended-lsp-nvim
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
