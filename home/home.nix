{config, pkgs, inputs, lib, ... }:
let
  wal =   "${dotfilesDir}/wallpapers/aenami_river.png";
  wal-l = "${dotfilesDir}/wallpapers/aenami_river.png";
  font = "Iosevka Nerd Font";
  header_font = "Jetbrains Mono Nerd Font";
  style = "dark";
  rounding = "10";
  scheme = "fidelity";
  bg-contrast = "0.2";
  fg-contrast = "0.6";
  transparency = "0.85";
  transparency_hex = "ff";
  outer_gap = "10";

  dotfilesDir = "${config.home.homeDirectory}/limitless";
  obsidianDir = "${config.home.homeDirectory}/Obsidian";
  templateDir = "${dotfilesDir}/home/templates";
in
{
  programs.home-manager.enable = true;
  home.stateVersion = "24.05";

  home.username = "zyn";
  home.homeDirectory = "/home/zyn";

  imports = [
    # frange inputs
    inputs.matugen.nixosModules.default
    inputs.nix-colors.homeManagerModules.default

    # Files (w/ Inputs)
    (import ./matugen.nix { inherit wal style rounding transparency outer_gap font header_font transparency_hex config templateDir obsidianDir; })
    (import ./config/desktop/hyprland.nix { inherit config inputs pkgs; })
    (import ./config/desktop/hyprlock.nix { inherit wal wal-l style rounding; })
    (import ./config/ags.nix { inherit config inputs pkgs rounding dotfilesDir; })
    (import ./config/nvim.nix { inherit config lib pkgs dotfilesDir; })
    (import ./config/cli/fish.nix { inherit style pkgs; })
    (import ./config/apps/kitty.nix { inherit config outer_gap font; })

    # Files 
    ./config/desktop/hypridle.nix
    ./config/cli/git.nix
    ./config/cli/helix.nix
    ./config/cli/ranger.nix
    ./config/cli/starship.nix
    # ./config/cli/fastfetch.nix

    # Wal Templates
    ./templates/kitty_wal_template.nix
    ./templates/ags_wal_template.nix
    ./templates/gtk_wal_template.nix

  ];

  systemd.user.startServices ="sd-switch";

  home.packages = [
    (import ../scripts/theme.nix { inherit config inputs pkgs wal wal-l style rounding scheme bg-contrast fg-contrast dotfilesDir; })
    (import ../scripts/color_script.nix { inherit pkgs; })
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

    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    WLR_RENDERER = "vulkan";
    GTK_USE_PORTAL = "1";
    NIXOS_XDG_OPEN_USE_PORTAL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    NIXOS_OZONE_WL = "1";
  };
}
