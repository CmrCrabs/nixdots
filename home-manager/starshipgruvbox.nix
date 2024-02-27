{ pkgs, config, inputs, ... }:
{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };
  xdg.configFile."starship.toml".text = ''
"$schema" = 'https://starship.rs/config-schema.json'

format = """
[](red)\
$os\
$username\
[](bg:yellow fg:red)\
$directory\
[](fg:yellow bg:cyan)\
$git_branch\
$git_status\
[](fg:cyan bg:blue)\
$c\
$rust\
$golang\
$nodejs\
$php\
$java\
$kotlin\
$haskell\
$python\
[](fg:blue bg:black)\
$docker_context\
[](fg:black bg:black)\
$time\
[ ](fg:black)\
$line_break$character"""

palette = 'nix-col'

[palettes.nix-col]
white = '#ffffff'

[os]
disabled = false
style = "bg:red fg:white"

[os.symbols]
Windows = "󰍲"
Ubuntu = "󰕈"
SUSE = ""
Raspbian = "󰐿"
Mint = "󰣭"
Macos = "󰀵"
Manjaro = ""
Linux = "󰌽"
Gentoo = "󰣨"
Fedora = "󰣛"
Alpine = ""
Amazon = ""
Android = ""
Arch = "󰣇"
Artix = "󰣇"
CentOS = ""
Debian = "󰣚"
Redhat = "󱄛"
RedHatEnterprise = "󱄛"

[username]
show_always = true
style_user = "bg:red fg:white"
style_root = "bg:red fg:white"
format = '[ $user ]($style)'

[directory]
style = "fg:white bg:yellow"
format = "[ $path ]($style)"
truncation_length = 3
truncation_symbol = "…/"

[directory.substitutions]
"Documents" = "󰈙 "
"Downloads" = " "
"Music" = "󰝚 "
"Pictures" = " "
"Developer" = "󰲋 "

[git_branch]
symbol = ""
style = "bg:cyan"
format = '[[ $symbol $branch ](fg:white bg:cyan)]($style)'

[git_status]
style = "bg:cyan"
format = '[[($all_status$ahead_behind )](fg:white bg:cyan)]($style)'

[nodejs]
symbol = ""
style = "bg:blue"
format = '[[ $symbol( $version) ](fg:white bg:blue)]($style)'

[c]
symbol = " "
style = "bg:blue"
format = '[[ $symbol( $version) ](fg:white bg:blue)]($style)'

[rust]
symbol = ""
style = "bg:blue"
format = '[[ $symbol( $version) ](fg:white bg:blue)]($style)'

[golang]
symbol = ""
style = "bg:blue"
format = '[[ $symbol( $version) ](fg:white bg:blue)]($style)'

[php]
symbol = ""
style = "bg:blue"
format = '[[ $symbol( $version) ](fg:white bg:blue)]($style)'

[java]
symbol = " "
style = "bg:blue"
format = '[[ $symbol( $version) ](fg:white bg:blue)]($style)'

[kotlin]
symbol = ""
style = "bg:blue"
format = '[[ $symbol( $version) ](fg:white bg:blue)]($style)'

[haskell]
symbol = ""
style = "bg:blue"
format = '[[ $symbol( $version) ](fg:white bg:blue)]($style)'

[python]
symbol = ""
style = "bg:blue"
format = '[[ $symbol( $version) ](fg:white bg:blue)]($style)'

[docker_context]
symbol = ""
style = "bg:black"
format = '[[ $symbol( $context) ](fg:#83a598 bg:black)]($style)'

[time]
disabled = false
time_format = "%R"
style = "bg:black"
format = '[[  $time ](fg:white bg:black)]($style)'

[line_break]
disabled = false

[character]
disabled = false
success_symbol = '[](bold fg:green)'
error_symbol = '[](bold fg:red)'
vimcmd_symbol = '[](bold fg:green)'
vimcmd_replace_one_symbol = '[](bold fg:magenta)'
vimcmd_replace_symbol = '[](bold fg:magenta)'
vimcmd_visual_symbol = '[](bold fg:yellow)'



  '';
}
