{ pkgs, config, inputs ...}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable =true;
    xwayland.enable = true;
    
    "$mainMod" = "ALT";
    "$terminal" = "alacritty";
    "$filebrowser" = "spacefm";
    "$launcher" = "rofi -show drun";
    "$screenshot" = "grim -g "$(slurp -d)" - | wl-copy";
    "screenshotsave" = "grim -g $("slurp")";
    "$browser" = "firefox-developer-edition";
    
    settings = {
      exec-once = [
	# "hyprpaper"
        "waybar"
        "sudo tlp start" 
      ];

      monitor = [
        "eDP-1, 1920x1080@60, 0x0, 1"
        "DP-1, 1920x515@60, 0x1080, 1"
      ];
      
      general = { 
        layout = "dwindle";
        resize_on_border = true;
      };
      
      misc = {
        disable_splash_rendering = true;
        force_default_wallpaper = 1;
        mouse_move_enables_dpms = true;
        animate_manual_resizes = true;
      };
      
      input = {
        kb_layout = "gb";
        touchpad = {
          middle_button_emulation = true;
        };
      };
      dwindle = {
        psuedotile = true;
        preserve_split = true;
      };
      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = "3";
      };
    };
    
    decoration = {
      rounding = "0";
      drop_shadow = "yes";
      shadow_range = "20";
      shadow_render_power = "3";
      "col.shadow" = "0x22000000";
      dim_inactive = false;
      dim_strength = "0.1";

      blur = {
        enabled = true;
        size = "8";
        passes = "3";
        new_optimizations = "on";
        noise = "0.01";
        contrast = "0.9";
        brightness = "0.8";
        popups = true;
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
    windowrulev2 = "noborder, class:^(firefoxdeveloperedition)$,title:^(Firefox Developer Edition)$";
    windowrulev2 = "float, class:.*";
    windowrulev2 = "maxsize 1920 1080, class:.*";
    windowrule = "minsize 720 457,^(Alacritty)$";
    windowrulev2 = "nofullscreenrequest, class:firefoxdeveloperedition), title:(Picture-in-Picture)";
    windowrulev2 = "float, class:(firefoxdeveloperedition), title:(Picture-in-Picture)";
    windowrulev2 = "pin, class:(firefoxdeveloperedition), title:(Picture-in-Picture)";

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
}
