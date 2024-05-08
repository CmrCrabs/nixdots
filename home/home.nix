{ config, pkgs, inputs, lib, ... }:
let
  wal = "${dotfilesDir}/wallpapers/painterly_plane.png";
  wal-l = "${dotfilesDir}/wallpapers/painterly_plane.png";
  style = "dark";
  rounding = "5";
  scheme = "expressive";
  contrast = "1.0";

  dotfilesDir = "${config.home.homeDirectory}/.dotfiles";
  templateDir = "${dotfilesDir}/home/templates";
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
     (import ./config/desktop/hyprland.nix { inherit wal wal-l style rounding scheme contrast config; })
     (import ./config/desktop/hyprlock.nix { inherit wal wal-l style rounding; })
     (import ./config/ags.nix { inherit config inputs pkgs rounding dotfilesDir; })
     (import ./config/nvim.nix { inherit config lib pkgs dotfilesDir; })
     (import ./config/cli/fish.nix { inherit style pkgs; })

    # Files 
     ./config/desktop/hypridle.nix

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
    TERMINAL = "kitty";
    BROWSER = "firefox";
    GTK_THEME = "matugen";
    DOTNET_CLI_TELEMETRY_OPTOUT = "1";
    NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM = 1;
    XCURSOR_THEME = "macOS-BigSur";
    XCURSOR_SIZE = "24";
    CMAKE_MAKE_PROGRAM = "${pkgs.cmake}";
    TEST = "real";
  };
}
