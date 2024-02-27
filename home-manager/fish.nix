{ config, pkgs, ... }:
let
  aliases = {
    "v" = "vim";
    "nv" = "nvim";
    "ls" = "eza --icons";
    "ll" = "eza -l --icons";
    "lt" = "eza -l --icons -T";
    "lla" = "eza -la --icons";
    "sda" = "alacritty &";
    "rgr" = "ranger";
    "hx" = "helix";
    "cl" = "clear";
    "cln" = "clear && ls";
    "rbt" = "sudo reboot";
    "nm" = "sudo nmtui";
    "wft" = "ping gnu.org -c 1";
  };

in {
  programs.fish = {
    enable = true;
    shellAbbrs = aliases;
    shellInit = ''
      set -g fish_greeting
      starship init fish | source 
    '';
  };
}
