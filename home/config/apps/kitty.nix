{ ... }:
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

      # include colors.conf
      
      include ~/.config/kitty/colors.conf

    '';
  };

}
