{ config, pkgs, ... }:
let
  aliases = {
    "v" = "vim";
    "nv" = "nvim";
    "ls" = "eza";
    "ll" = "eza -l";
    "lla" = "eza -la";
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
    shellInit = "starship init fish | source ";
  };
}
