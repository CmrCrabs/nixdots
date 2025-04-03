{ config, lib, pkgs, dotfilesDir, ...}:
{
    home.packages = with pkgs; [
        lua-language-server
        typescript-language-server
        rust-analyzer
        vimPlugins.omnisharp-extended-lsp-nvim
        # tinymist
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
