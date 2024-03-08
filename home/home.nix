{ config, pkgs, inputs, wal, ... }:
let
  wal = "~/.dotfiles/home/images/wallpapers/audi.jpg";
  templateDir = "${config.home.homeDirectory}/.dotfiles/home/templates";
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
     (import ./config/desktop/hyprland.nix { inherit wal config; })

    # Files 
     ./config/apps/kitty.nix
     ./config/apps/wezterm.nix

     ./config/cli/fish.nix
     ./config/cli/git.nix
     ./config/cli/helix.nix
     ./config/cli/ranger.nix
     ./config/cli/starship.nix
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
