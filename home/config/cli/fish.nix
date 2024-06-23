{ pkgs, style, ... }:
let
  abbr = {
    "v" = "vim";
    "ll" = "eza -l --icons --no-permissions --no-user --no-time --group-directories-first";
    "lt" = "eza -l --icons -T --no-permissions --no-user --no-time --group-directories-first --no-filesize";
    "la" = "eza -la --icons --no-permissions --no-user --no-time --group-directories-first";
    "sdt" = "$TERMINAL &> /dev/null & && disown";
    "rgr" = "ranger";
    "cl" = "clear";
    "cls" = "clear && ls";
    "rbt" = "sudo reboot";
    "nm" = "sudo nmtui";
    "wft" = "ping gnu.org -c 1";
    "bat" = "cat /sys/class/power_supply/BAT0/capacity";
    "nv" = "steam-run nvim";
    # "nvim" = "steam-run nvim";
    "cpng" = "mogrify -format png *.jpg && rm *.jpg";
    "shell" = "nix-shell . --command \"fish\"";
    "rst" = "exit && cd && clear && colors";
  }; 
  aliases = {
    "ls" = "eza --icons --no-permissions --no-user --no-time --group-directories-first";
  };
  in {
  programs.fish = {
    enable = true;
    shellAbbrs = abbr;
    shellAliases = aliases;
    interactiveShellInit = ''
      starship init fish | source 
    '';
    shellInit = ''
    set -g fish_greeting
    colors

    '';
  };
}
