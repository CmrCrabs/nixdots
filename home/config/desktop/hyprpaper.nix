{ pkgs, config, inputs, ...}:
{
  xdg.configFile."hypr/hyprpaper.conf".text = ''
    # preload
    home
    preload = /home/zyn/wallpapertemp.jpg 
    
    preload = /home/zyn/wallpapertemp.jpg
    
    # load
    
    wallpaper = eDP-1,/home/zyn/wallpapertemp.jpg
    wallpaper = DP-3,/home/zyn/wallpapertemp.jpg
  '';
}
