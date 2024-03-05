{ config, pkgs, inputs, ... }:

{ 
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

  # Touchpad
  services.xserver.libinput.enable = true;
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


  # Sound
  sound.enable = true; 
  hardware.pulseaudio.enable = true; 
  hardware.pulseaudio.extraConfig = "load-module module-combine-sink"; 
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
      monospace = [ "Jetbrains Mono Nerd FOnt" ]; 
    };
  };
  
  # pkgs
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # Apps
    firefox
    firefox-devedition-bin
    discord
    vesktop
    wezterm
    kitty
    rofi-wayland
    dunst
    waybar
    kicad
    feh
    
    # Term
    vim
    neovim
    helix
    wget
    git
    gh
    neofetch
    starship
    btop

    eza
    zoxide

    hyprpaper
    brightnessctl
    pamixer
    alsa-tools
 
    # Libs / Utils
    grim
    slurp
    wl-clipboard
    libnotify

    yarn
    nodePackages.npm
    nodejs_21
    
    dotnet-sdk_7
    dotnet-runtime_7

    gcc

  ];

  # dont touch
  system.stateVersion = "23.11";
}
