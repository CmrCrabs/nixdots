{ pkgs, style, ... }:
let
  abbr = {
    "v" = "vim";
    "ll" = "eza -l --icons --no-permissions --no-user --no-time --group-directories-first";
    "lt" = "eza -l --icons -T --no-permissions --no-user --no-time --group-directories-first --no-filesize";
    "la" = "eza -la --icons --no-permissions --no-user --no-time --group-directories-first";
    "sdt" = "$TERMINAL &> /dev/null &";
    "rgr" = "ranger";
    "cl" = "clear";
    "cls" = "clear && ls";
    "rbt" = "sudo reboot";
    "nm" = "sudo nmtui";
    "wft" = "ping gnu.org -c 1";
    "bat" = "cat /sys/class/power_supply/BAT0/capacity";
    "nv" = "steam-run nvim";
    "nvim" = "steam-run nvim";
    "cpng" = "find . -name \"*.jpg\" -exec mogrify -format png {} \;";
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
      set -g fish_color_search_match --background='${if style == "dark" then "999" else if style == "light" then "111" else "red"}'
      set -g fish_color_autosuggestion --background='${if style == "dark" then "999" else if style == "light" then "111" else "red"}'
    '';
  };
}
