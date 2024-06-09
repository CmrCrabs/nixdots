{ config, pkgs, inputs, lib, ... }:
let
  wal =   "${dotfilesDir}/wallpapers/mountain_macos.png";
  wal-l = "${dotfilesDir}/wallpapers/mountain_macos.png";
  style = "dark";
  rounding = "10";
  scheme = "fidelity";
  bg-contrast = "0.4";
  fg-contrast = "0.4";
  transparency = "1.0";
  outer_gap = "5";

  dotfilesDir = "${config.home.homeDirectory}/limitless";
  templateDir = "${dotfilesDir}/home/templates";
in
{
  programs.home-manager.enable = true;
  home.stateVersion = "23.11";

  home.username = "zyn";
  home.homeDirectory = "/home/zyn";

  imports = [
    # flake inputs
    inputs.matugen.nixosModules.default
    inputs.nix-colors.homeManagerModules.default

    # Files (w/ Inputs)
    (import ./matugen.nix { inherit wal style rounding transparency outer_gap config templateDir; })
    (import ./config/desktop/hyprland.nix { inherit config inputs pkgs; })
    (import ./config/desktop/hyprlock.nix { inherit wal wal-l style rounding; })
    (import ./config/ags.nix { inherit config inputs pkgs rounding dotfilesDir; })
    (import ./config/nvim.nix { inherit config lib pkgs dotfilesDir; })
    (import ./config/cli/fish.nix { inherit style pkgs; })
    (import ./config/apps/kitty.nix { inherit config; })

    # Files 
    ./config/desktop/hypridle.nix
    ./config/cli/git.nix
    ./config/cli/helix.nix
    ./config/cli/ranger.nix
    ./config/cli/starship.nix

    # Wal Templates
    ./templates/kitty_wal_template.nix
    ./templates/ags_wal_template.nix

  ];

  systemd.user.startServices ="sd-switch";

  home.packages = [
    (import ./theme.nix { inherit config inputs pkgs wal wal-l style rounding scheme bg-contrast fg-contrast dotfilesDir; })
  ];

  # NUR

  home.file."nix/config.nix".text = ''
  {
    nixpkgs.config.packageOverrides = pkgs: {
      nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
        inherit pkgs;
      };
    };
  }

  '';

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
    ADW_DISABLE_PORTAL=1;
    # KRITA_NO_STYLE_OVERRIDE=1;
  };
}
