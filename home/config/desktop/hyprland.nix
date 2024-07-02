{ config, inputs, pkgs, ...}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    
    plugins = [
      # inputs.hyprland-plugins.packages."${pkgs.system}".hyprbars
      # inputs.hyprland-plugins.packages."${pkgs.system}".borders-plus-plus
      # inputs.hyprspace.packages.${pkgs.system}.Hyprspace
    ];

    
        
    settings = {
      source = [
        "~/.config/hypr/vars.conf"
      ];
      "$mainMod" = "ALT";
      "$terminal" = "kitty";
      "$filebrowser" = "ranger";
      "$launcher" = "ags --toggle-window start_menu";
      "$screenshot" = "grim -g \"$(slurp -d)\" - | wl-copy -t image/png";
      "$browser" = "firefox";
      "$locker" = "hyprlock";


      exec-once = [
        "swww init &"
        "sudo tlp start" 
        "hypridle"
        "ags"
        "wlsunset -l 52.2 -L 0.13"
      ];
      exec = [
      ];


      monitor = [
        "eDP-1, 1920x1080@60, 0x0, 1"
        "DP-1, 1920x515@60, 0x1080, 1"
      ];
      workspace = [
        "eDP-1, 1"
        "DP-1, 10"        
        # "1, persistent:true"
        # "2, persistent:true"
        # "3, persistent:true"
        # "4, persistent:true"
      ];
      
      general = { 
        layout = "dwindle";
        resize_on_border = "yes";
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
        drop_shadow = "no";
        shadow_range = "10";
        shadow_render_power = "3";
        shadow_offset = "0, 0";
        "col.shadow" = "rgba(000000cc)";
        dim_inactive = "yes";
        dim_strength = "0.15";

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
        bezier = [
          "myBezier, 0.05, 0.9, 0.1, 1.05"
          "menu_decel, 0.1, 1, 0, 1"
          "menu_accel, 0.38, 0.04, 1, 0.07"
          "md3_decel, 0.05, 0.7, 0.1, 1"
          "md3_accel, 0.3, 0, 0.8, 0.15"
        ];
        animation = [
          "windows, 1, 3, md3_decel, popin 60%"
          "windowsIn, 1, 3, md3_decel, popin 60%"
          "windowsOut, 1, 3, md3_accel, popin 60%"
          "border, 1, 10, default"
          "fade, 1, 3, md3_decel"
          "layersIn, 1, 3, default, popin 80%"
          "layersIn, 1, 3, menu_decel, slide"
          "layersOut, 1, 1.6, menu_accel"
          "fadeLayersIn, 1, 2, menu_decel"
          "fadeLayersOut, 1, 4.5, menu_accel"
          "workspaces, 1, 3, menu_decel, slide"
        ];
      };
      
      layerrule = [
        "blur,^(vertical_bar)$"
        "ignorezero,^(vertical_bar)$"
        "blur,^(dock)$"
        "ignorezero,^(dock)$"
        "blur,^(start_menu)$"
        "ignorezero,^(start_menu)$"
        "blur,^(notification_tray)$"
        "ignorezero,^(notification_tray)$"
        "animation slide right,^(notification_tray)$"
        "blur,^(notifications)$"
        "ignorezero,^(notifications)$"
        "animation slide top,^(notifications)$"
        "animation slide right,^(systray)$"
        "blur,^(powermenu)$"
        "ignorezero,^(powermenu)$"
        "blur,^(control_center)$"
        "ignorezero,^(control_center)$"
        "animation slide left,^(control_center)$"
      ];
      windowrulev2 = [
        "tile, class:^(firefox)$,title:^(Firefox)$"
        "maxsize 1920 1080, class:.*"
        # "nofullscreenrequest, class:firefox), title:(Picture-in-Picture)"
        "float, class:(firefox), title:(Picture-in-Picture)"
        "pin, class:(firefox), title:(Picture-in-Picture)" 
      ];
      windowrule = "size 880 690,^(kitty)$";
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindr = [
        "SUPER,SUPER_L,exec,ags --toggle-window start_menu"
      ];
      bind = [
        # "$mainMod SHIFT, Q, overview, toggle"
        "$mainMod, Q, exec, $terminal"
        "$mainMod, E, exec, [float] $terminal"
        "$mainMod, C, killactive,"
        "$mainMod SHIFT, E, exit,"
        "$mainMod, F, togglefloating,"
        "$mainMod, D, exec, $launcher"
        "$mainMod, P, pseudo, # dwindle"
        "$mainMod, B, togglesplit, # dwindle"
        "$mainMod, M, fullscreen"
        "$mainMod SHIFT, P, exec, $locker"

        "$mainMod SHIFT, S, exec, $screenshot"
        "$mainMod SHIFT, W, exec, $screenshotsave"
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, , movefocus, u"
        "$mainMod, J, movefocus, d"
        
        "$mainMod, H, bringactivetotop"
        "$mainMod, L, bringactivetotop"
        "$mainMod, , bringactivetotop"
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
    extraConfig = ''
    decoration {
      rounding = $rounding
    }
    general {
      gaps_in = $outer_gap
      gaps_out = $outer_gap
    }

    monitor = eDP-1,addreserved,0, 90 + $outer_gap, 0, 0
    '';
  };
}
