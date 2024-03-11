{ config, lib, pkgs, ...}:
{
    home.packages = with pkgs; [
        tree-sitter
        lua-language-server
        nil
        nixpkgs-fmt
        fd
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
