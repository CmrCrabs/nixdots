{ config, inputs, pkgs, wal, wal-l, style, rounding, scheme, bg-contrast, fg-contrast, dotfilesDir, ...}:
pkgs.writeShellScriptBin "cgtheme" ''
    swww img -o eDP-1 ${wal} --transition-type center --transition-fps 60 --transition-duration 1
    swww img -o DP-1 ${wal-l} --transition-type center --transition-fps 60 --transition-duration 1
    wal -i ${wal} -n -s -t --saturate ${fg-contrast} ${if style == "dark" then "" else if style == "light" then "-l" else ""}
    matugen image -m ${style} ${wal} -t scheme-${scheme} -v --contrast ${bg-contrast} --show-colors
    cp ~/.cache/wal/fg_colors.scss ~/.config/ags/scss/fg_colors.scss
    cp ~/.cache/wal/fg_colors.scss ~/Obsidian/.obsidian/themes/wal-matugen/scss/fg_colors.scss
    sassc ~/.config/ags/scss/style.scss ~/.config/ags/scss/my-style.css
    sassc ~/Obsidian/.obsidian/themes/wal-matugen/scss/style.scss ~/Obsidian/.obsidian/themes/wal-matugen/theme.css
''

