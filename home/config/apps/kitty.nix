{ config, ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "Jetbrains Mono Nerd Font";
      italic_font = "auto";
      bold_font = "auto";
      bold_italic_font = "auto";
      font_size = 12;
      disable_ligatures = "never";
      confirm_os_window_close = 0;
      window_padding_width = 18;
      adjust_line_height = 0;
      adjust_column_width = 0;
      box_drawing_scale = "0.01, 0.8, 1.5, 2";
      mouse_hide_wait = 0;
      focus_follows_mouse = "no";

      repaint_delay = 20;
      input_delay = 2;
      sync_to_monitor = "no";

      visual_bell_duration = 0;
      enable_audio_bell = "no";
      bell_on_tab = "yes";
    };
    extraConfig = ''
      cursor_shape beam
      cursor_blink_interval -1
      resize_in_steps no
      shell fish
      background_opacity         1.0
      dynamic_background_opacity yes

      
      include ~/.config/kitty/colors.conf

    '';
  };

  #xdg.configFile."kitty/colors.conf".text = with config.colorScheme.palette; ''
  #  background #${base00}
  #  foreground #${base05}
  #  selection_background #${base05}
  #  selection_foreground #${base00}
  #  url_color #${base04}
  #  cursor #${base05}
  #  active_border_color #${base03}
  #  inactive_border_color #${base01}
  #  active_tab_background #${base00}
  #  active_tab_foreground #${base05}
  #  inactive_tab_background #${base01}
  #  inactive_tab_foreground #${base04}
  #  tab_bar_background #${base01}
  #  wayland_titlebar_color #${base00}
  #  macos_titlebar_color #${base00}

  #  # normal
  #  color0 #${base00}
  #  color1 #${base08}
  #  color2 #${base0B}
  #  color3 #${base0A}
  #  color4 #${base0D}
  #  color5 #${base0E}
  #  color6 #${base0C}
  #  color7 #${base05}

  #  # bright
  #  color8 #${base03}
  #  color9 #${base09}
  #  color10 #${base01}
  #  color11 #${base02}
  #  color12 #${base04}
  #  color13 #${base06}
  #  color14 #${base0F}
  #  color15 #${base07}

  #'';
}
