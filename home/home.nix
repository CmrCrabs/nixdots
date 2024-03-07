{ config, pkgs, inputs, wal, ... }:
let
  wal = "~/.dotfiles/images/wallpapers/lambo.jpg";
  templateDir = "~/.dotfiles/home/templates";
in
{
  programs.home-manager.enable = true;
  home.stateVersion = "23.11";

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;
  home.username = "zyn";
  home.homeDirectory = "/home/zyn";

  imports = [
    # flake inputs
    inputs.matugen.nixosModules.default
    inputs.nix-colors.homeManagerModules.default

    # Files (w/ Inputs)
     (import ./matugen.nix { inherit wal config templateDir; })
     (import ./config/hyprland.nix { inherit wal config; })
     ./config/kitty.nix

    # Files 
     ./config/fish.nix
     ./config/git.nix

     ./config/hyprpaper.nix

     ./config/wezterm.nix
     ./config/starship.nix
     ./config/helix.nix
     ./config/ranger.nix
  ];

  systemd.user.startServices ="sd-switch";

  home.packages = [
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "wezterm";
    BROWSER = "firefox";
    DOTNET_CLI_TELEMETRY_OPTOUT = "1";
    NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM = 1;
  };
}
