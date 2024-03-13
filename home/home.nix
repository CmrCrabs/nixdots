{ config, pkgs, inputs, ... }:
let
  wal = "~/.dotfiles/home/images/wallpapers/aenami_endless.png";
  wal-l = "~/.dotfiles/home/images/wallpapers/aenami_endless.png";
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
     (import ./config/desktop/hyprlock.nix { inherit wal wal-l style; })
     (import ./config/cli/fish.nix { inherit style pkgs; })

    # Files 
     ./config/nvim.nix
 
     ./config/desktop/hypridle.nix

     ./config/apps/kitty.nix
     ./config/apps/wezterm.nix

     ./config/cli/git.nix
     ./config/cli/helix.nix
     ./config/cli/ranger.nix
     ./config/cli/starship.nix

     #./config/misc/gtk3.nix
     #./config/misc/gtk4.nix
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
    XCURSOR_THEME = "Vimix-cursors";
    XCURSOR_SIZE = "24";
  };
}
