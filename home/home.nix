{ config, pkgs, inputs, ... }:
let
  wal = "~/.dotfiles/home/images/wallpapers/aenami_horizon.jpg";
  wal-l = "~/.dotfiles/home/images/wallpapers/aenami_horizon.jpg";
  style = "dark";
  templateDir = "${config.home.homeDirectory}/.dotfiles/home/templates";
in
{
  programs.home-manager.enable = true;
  home.stateVersion = "23.11";

  colorScheme = inputs.nix-colors.colorschemes.catppuccin-mocha;
  home.username = "zyn";
  home.homeDirectory = "/home/zyn";

  imports = [
    # flake inputs
    inputs.matugen.nixosModules.default
    inputs.nix-colors.homeManagerModules.default

    # Files (w/ Inputs)
     (import ./matugen.nix { inherit wal style config templateDir; })
     (import ./config/desktop/hyprland.nix { inherit wal wal-l style config; })
     (import ./config/cli/fish.nix { inherit style; })

    # Files 
     ./config/apps/kitty.nix
     ./config/apps/wezterm.nix

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
