{ config, pkgs, inputs, ... }:

{
  imports = [
    # flake inputs
    inputs.nix-colors.homeManagerModules.default

    # Files
    ./fish.nix
    ./git.nix
    ./hyprland.nix
    ./hyprpaper.nix
    ./wezterm.nix
    ./starship.nix
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";

  home.username = "zyn";
  home.homeDirectory = "/home/zyn";
  
  systemd.user.startServices = "sd-switch";

  colorScheme = inputs.nix-colors.colorSchemes.everforest-dark-hard;
  # colorScheme = inputs.nix-colors.colorSchemes.tokyo-night-storm;

  home.packages = [
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "wezterm";
    BROWSER = "firefox-developer-edition";
  };
}
