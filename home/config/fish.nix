{ config, pkgs, ... }:
let
  aliases = {
    "v" = "vim";
    "nv" = "nvim";
    "ls" = "eza --icons --no-permissions --no-user --no-time --group-directories-first";
    "ll" = "eza -l --icons --no-permissions --no-user --no-time --group-directories-first";
    "lt" = "eza -l --icons -T --no-permissions --no-user --no-time --group-directories-first --no-filesize";
    "la" = "eza -la --icons --no-permissions --no-user --no-time --group-directories-first";
    "sdt" = "$TERMINAL &";
    "rgr" = "ranger";
    "cl" = "clear";
    "cln" = "clear && ls";
    "rbt" = "sudo reboot";
    "nm" = "sudo nmtui";
    "wft" = "ping gnu.org -c 1";
    "bat" = "cat /sys/class/power_supply/BAT0/capacity";
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
