{ config, pkgs, inputs, ... }:

{
  imports = [
    # flake inputs
    inputs.matugen.nixosModules.default

    inputs.nix-colors.homeManagerModules.default

    # Files
    ./config/fish.nix
    ./config/git.nix

    ./config/hyprland.nix
    ./config/hyprpaper.nix

    ./config/wezterm.nix
    ./config/starship.nix
    ./config/neofetch.nix
    ./config/helix.nix
    # ./config/ranger.nix
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";

  home.username = "zyn";
  home.homeDirectory = "/home/zyn";
  
  systemd.user.startServices = "sd-switch";

  colorScheme = inputs.nix-colors.colorSchemes.everforest-dark-hard;
  # colorScheme = nix-colors.lib.schemeFromYAML "pywal" (builtins.readFile ~/.cache/wal/colors.yml);

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
