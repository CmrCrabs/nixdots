{ config, pkgs, inputs, ... }:
let
  system = "x86_64-linux";
  asus-wmi-screenpad = config.boot.kernelPackages.callPackage ../derivs/asus-wmi-screenpad.nix {};
in { 
  imports = [
    ./hardware-configuration.nix 
  ];

  # Bootloader.
  boot.loader = {
    systemd-boot.enable = false;
    grub = { 
      enable = true;
      efiSupport = true;
      device = "nodev";
      configurationLimit = 3;
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };

  networking = { 
    hostName = "zyn-nixos";
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = { 
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8"; 
    LC_TIME = "en_GB.UTF-8";
  };

  nix.settings = { 
    experimental-features = [ "nix-command" "flakes"];
    auto-optimise-store = true;
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  # Hyprland
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };
  
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  services.libinput.enable = true;
  services.upower.enable = true;
  services.gvfs.enable = true;
  console.keyMap = "uk";

  # Services
  services.tlp = {
    enable = true;
    settings = {
      INTEL_GPU_MIN_FREQ_ON_AC = 500;
      INTEL_GPU_MIN_FREQ_ON_BAT = 500;

      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
    };
  };

  security.pam.services.swaylock = {};

  programs.nix-ld.enable = true;


  # Sound
  hardware.pulseaudio.extraConfig = "load-module module-combine-sink"; 
  sound.enable = true; 
  hardware.pulseaudio.enable = true; 
  security.rtkit.enable = true; 

  # services.pipewire = {
  #   enable = true; 
  #   alsa.enable = true; 
  #   alsa.support32Bit = true; 
  #   pulse.enable = true;
  #   #media-session.enable = true;
  # };

  # users
  users.users.zyn = { 
   isNormalUser = true; 
   description = "zyn user acc"; 
   extraGroups = [ "networkmanager" "wheel" "audio" ]; 
   packages = with pkgs; [];
  };

  # visual
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" "Iosevka" ]; })
  ];
  fonts.fontconfig = {
    defaultFonts = {
      sansSerif = [ "Jetbrains Mono Nerd Font" ];
      monospace = [ "Jetbrains Mono Nerd Font" ]; 
    };
  };

  programs.bash.shellAliases = {
    h = "Hyprland";
  };
  
  # pkgs

  #boot.extraModulePackages = with config.boot.kernelPackages; [
  #  asus-wmi-screenpad
  #];
  
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # Flake imports
    inputs.matugen.packages.${system}.default
    inputs.hyprlock.packages.${system}.default
    inputs.hypridle.packages.${system}.default
    inputs.ags.packages.${system}.default

    # NUR
    config.nur.repos.nltch.spotify-adblock
    
    # Apps
    firefox
    chromium
    blender
    discord
    kitty
    rofi-wayland
    waybar
    feh
    inkscape
    spotify
    krita
    remnote
    gnome.nautilus

    
    # Term
    vim
    neovim
    helix
    wget
    git
    gh
    fastfetch
    starship
    btop
    ranger

    eza
    yazi

    hyprpaper
    swww
    flavours
    brightnessctl
    pamixer
    alsa-tools
    pywal
    cbonsai
 
    # Libs / Utils
    cmake
    gnumake
    ninja
    
    libdbusmenu-gtk3

    playerctl

    grim
    slurp
    wl-clipboard
    libnotify
    ripgrep

    yarn
    nodePackages.npm
    
    dotnet-sdk_7
    dotnet-sdk
    mono
    mono4
    dotnet-runtime_7
    vimPlugins.omnisharp-extended-lsp-nvim

    rustup

    gcc
    zip

    steam-run

    imagemagick

    apple-cursor
    whitesur-icon-theme
    whitesur-gtk-theme

    nix-prefetch-git
    stdenv

    unzip
    sassc

    wallust
    python311Packages.pip

    alsa-oss
    alsa-lib

    hyprcursor

    # WGPU
    vulkan-loader
    wayland
    libxkbcommon
    xorg.libX11
    xorg.libXcursor
    xorg.libXi
    xorg.libXrandr
    spirv-tools
  ];

  # dont touch
  system.stateVersion = "24.05";
}
