{ wal, wal-l, style, ... }:
{
  xdg.configFile."hypr/hyprlock.conf".text = ''

    source = ~/.config/hypr/colors.conf
    
    background {
        monitor =
        path = ${wal}   # only png supported for now
        blur_size = 4
        blur_passes = 3 # 0 disables blurring
        noise = 0.0117
        contrast = 1.3000 # Vibrant!!!
        brightness = 0.8000
        vibrancy = 0.2100
        vibrancy_darkness = 0.0
    }
    
    input-field {
        monitor = eDP-1
        size = 250, 50
        outline_thickness = 3
        dots_size = 0.2 # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.64 # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = true
        outer_color = rgb($tertiary)
        inner_color = rgb($background)
        font_color = rgb($foreground)
        fade_on_empty = false
        placeholder_text = <i>Password...</i> # Text rendered in the input box when it's empty.
        hide_input = false
        position = 0, 50
        fail_color = rgb($error) # if authentication failed, changes outer_color and fail message color
        fail_text = <i>$FAIL <b>($ATTEMPTS)</b></i> # can be set to empty
        fail_transition = 300 # transition time in ms between normal outer_color and fail_color
        halign = center
        valign = bottom
    }
    
    # Current time
    label {
        monitor = eDP-1
        text = cmd[update:1000] echo "<b><big> $(date +"%H:%M:%S") </big></b>"
        color = rgb($primary)
        font_size = 64
        font_family = JetBrains Mono Nerd Font 10
        position = 0, 16
        halign = center
        valign = center
    }
    
  '';
}
