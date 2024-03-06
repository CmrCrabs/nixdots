{ config, pkgs, inputs, ... }:

{
  imports = [
    # flake inputs
    inputs.nix-colors.homeManagerModules.default
    inputs.matugen.homeManagerModules.default

    # Files
    ./config/fish.nix
    ./config/git.nix
    ./config/hyprland.nix
    ./config/hyprpaper.nix
    ./config/wezterm.nix
    ./config/starship.nix
    ./config/neofetch.nix
    ./config/hypridle.nix
    # ./config/ranger.nix
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";

  home.username = "zyn";
  home.homeDirectory = "/home/zyn";
  
  systemd.user.startServices = "sd-switch";

  colorScheme = inputs.nix-colors.colorSchemes.everforest-dark-hard;
  # colorScheme = inputs.nix-colors.colorSchemes.onedark;


  home.packages = [
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "wezterm";
    BROWSER = "firefox";
    DOTNET_CLI_TELEMETRY_OPTOUT = "1";
    NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM= 1;
  };
}
