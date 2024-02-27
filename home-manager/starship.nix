{ pkgs, config, inputs, ... }:
{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };
  xdg.configFile."starship.toml".text = ''
    "$schema" = 'https://starship.rs/config-schema.json'
    
    format = """
    [](color_orange)\
    $username\
    [](bg:color_yellow fg:color_orange)\
    $directory\
    [](fg:color_yellow bg:color_aqua)\
    $git_branch\
    $git_status\
    [](fg:color_aqua bg:color_blue)\
    $c\
    $rust\
    $golang\
    $nodejs\
    $php\
    $java\
    $kotlin\
    $haskell\
    $python\
    [](fg:color_blue bg:color_bg3)\
    $docker_context\
    [](fg:color_bg3 bg:color_bg1)\
    $time\
    [ ](fg:color_bg1)\
    $line_break$character"""
    
    palette = 'nix-colors'
    
    [palettes.nix-colors]
    color_fg0 = '#${config.colorScheme.palette.base06}'
    color_bg1 = '#${config.colorScheme.palette.base00}'
    color_bg3 = '#${config.colorScheme.palette.base01}'
    color_blue = '#${config.colorScheme.palette.base0B}'
    color_aqua = '#${config.colorScheme.palette.base08}'
    color_green = '#${config.colorScheme.palette.base0B}}'
    color_orange = '#${config.colorScheme.palette.base0A}'
    color_purple = '#${config.colorScheme.palette.base0D}'
    color_red = '#${config.colorScheme.palette.base0E}'
    color_yellow = '#${config.colorScheme.palette.base0C}'
    
    [username]
    show_always = true
    style_user = "bg:color_orange fg:color_fg0"
    style_root = "bg:color_orange fg:color_fg0"
    format = '[ $user ]($style)'
    
    [directory]
    style = "fg:color_fg0 bg:color_yellow"
    format = "[ $path ]($style)"
    truncation_length = 3
    truncation_symbol = "…/"
    
    [directory.substitutions]
    "Documents" = "󰈙 "
    "Downloads" = " "
    "Music" = "󰝚 "
    "Pictures" = " "
    "proj" = "󰲋 "
    
    [git_branch]
    symbol = " "
    style = "bg:color_aqua"
    format = '[[ $symbol $branch ](fg:color_fg0 bg:color_aqua)]($style)'
    
    [git_status]
    style = "bg:color_aqua"
    format = '[[($all_status$ahead_behind )](fg:color_fg0 bg:color_aqua)]($style)'
    
    [nodejs]
    symbol = " "
    style = "bg:color_blue"
    format = '[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)'
    
    [c]
    symbol = " "
    style = "bg:color_blue"
    format = '[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)'
    
    [rust]
    symbol = " "
    style = "bg:color_blue"
    format = '[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)'
    
    [golang]
    symbol = " "
    style = "bg:color_blue"
    format = '[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)'
    
    [php]
    symbol = " "
    style = "bg:color_blue"
    format = '[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)'
    
    [java]
    symbol = " "
    style = "bg:color_blue"
    format = '[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)'
    
    [kotlin]
    symbol = " "
    style = "bg:color_blue"
    format = '[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)'
    
    [haskell]
    symbol = " "
    style = "bg:color_blue"
    format = '[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)'
    
    [python]
    symbol = " "
    style = "bg:color_blue"
    format = '[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)'
    
    [docker_context]
    symbol = " "
    style = "bg:color_bg3"
    format = '[[ $symbol( $context) ](fg:#83a598 bg:color_bg3)]($style)'
    
    [time]
    disabled = false
    time_format = "%R"
    style = "bg:color_bg1"
    format = '[[  $time ](fg:color_fg0 bg:color_bg1)]($style)'
    
    [line_break]
    disabled = false
    
    [character]
    disabled = false
    format = '[[ 󱄅 > ](fg:color_fg0)]($style)'
    
  '';
}
