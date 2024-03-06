{ pkgs, config, inputs, ...}:
let
  wal = "~/wallpapertest.jpg";
in {
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    
    plugins = [
      # inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
    ];
    
        
    settings = {
      "$mainMod" = "ALT";
      "$terminal" = "wezterm";
      "$filebrowser" = "spacefm";
      "$launcher" = "rofi -show drun";
      "$screenshot" = "grim -g \"$(slurp -d)\" - | wl-copy -t image/png";
      # "screenshotsave" = "grim -g $(\"slurp\")";
      "$browser" = "firefox-developer-edition";

      exec-once = [
	# "hyprpaper"
        "swww init &"
        "waybar"
        "sudo tlp start" 
        "hypridle"
      ];
      exec = [
        "swww img ${wal}"
      ];

      monitor = [
        "eDP-1, 1920x1080@60, 0x0, 1"
        "DP-3, 1920x515@60, 0x1080, 1"
      ];
      workspace = [
        "eDP-1, 1"
        "DP-3, 11"
      ];
      
      general = { 
        layout = "dwindle";
        resize_on_border = "yes";
        gaps_in = 5;
        gaps_out = 12;
        border_size = 0;
        "col.active_border" = "rgba(ffffffcc)";
        "col.inactive_border" = "rgba(ffffffcc)";
      };
      
      misc = {
        disable_hyprland_logo = "yes";
        disable_splash_rendering = "yes";
        mouse_move_enables_dpms = "yes";
        animate_manual_resizes = "yes";
        vfr = "yes";
      };
      
      input = {
        kb_layout = "gb";
        touchpad = {
          middle_button_emulation = "yes";
        };
      };
      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };
      gestures = {
        workspace_swipe = "yes";
        workspace_swipe_fingers = "3";
      };
    
      decoration = {
        rounding = "10";
        drop_shadow = "yes";
        shadow_range = "50";
        shadow_render_power = "9";
        "col.shadow" = "rgba(${config.colorScheme.palette.base00}cc)";
        dim_inactive = "yes";
        dim_strength = "0.1";

        blur = {
          enabled = "yes";
          size = "4";
          passes = "4";
          new_optimizations = "on";

          ignore_opacity = "yes";
          
          noise = "0.0117";
          contrast = "1.0";
          brightness = "1.0";
        };
      };
      
      animations = {
        enabled = "yes";
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 2, myBezier"
          "windowsOut, 1, 2, default, popin 80%"
          "border, 1, 2, default"
          "borderangle, 1, 6, default"
          "fade, 1, 2, default"
          "workspaces, 1, 1, default"
        ];
      };
      
      layerrule = "blur,^(rofi)$";
      windowrulev2 = [
        "noborder, class:^(firefoxdeveloperedition)$,title:^(Firefox Developer Edition)$"
        "float, class:.*"
        "maxsize 1920 1080, class:.*"
        "nofullscreenrequest, class:firefoxdeveloperedition), title:(Picture-in-Picture)"
        "float, class:(firefoxdeveloperedition), title:(Picture-in-Picture)"
        "pin, class:(firefoxdeveloperedition), title:(Picture-in-Picture)" 
      ];
      windowrule = "minsize 720 457,^(WezTerm)$";
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
       
      bind = [
        "$mainMod, Q, exec, $terminal"
        "$mainMod, C, killactive,"
        "$mainMod SHIFT, E, exit,"
        "$mainMod, E, exec, $browser"
        "$mainMod, F, togglefloating,"
        "$mainMod, D, exec, $launcher"
        "$mainMod, P, pseudo, # dwindle"
        "$mainMod, B, togglesplit, # dwindle"
        "$mainMod, M, fullscreen"

        "$mainMod SHIFT, S, exec, $screenshot"
        "$mainMod SHIFT, W, exec, $screenshotsave"
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"
        
        "$mainMod, H, bringactivetotop"
        "$mainMod, L, bringactivetotop"
        "$mainMod, K, bringactivetotop"
        "$mainMod, J, bringactivetotop"
        "ALT, Tab, cyclenext"
        "SHIFT ALT, Tab, cyclenext, prev"
        
        "ALT, Tab, bringactivetotop"
        "SHIFT ALT, Tab, bringactivetotop"
        
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod, -, workspace, 11"
        
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        "$mainMod SHIFT, -, movetoworkspace, 11"
        
        "$mainMod SHIFT, H, movewindow, l"
        "$mainMod SHIFT, L, movewindow, r"
        "$mainMod SHIFT, K, movewindow, u"
        "$mainMod SHIFT, J, movewindow, d"
        
        ",XF86AudioRaiseVolume,exec,pamixer -i 5"
        ",XF86AudioLowerVolume,exec,pamixer -d 5"
        ",XF86AudioMute,exec,pamixer -t"
        
        ",XF86MonBrightnessUp,exec,brightnessctl s 5%+"
        ",XF86MonBrightnessDown,exec,brightnessctl s 5%-"

      ];
    };
  };
}
