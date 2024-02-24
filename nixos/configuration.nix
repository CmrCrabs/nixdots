{ config, pkgs, ... }:

{ 
  imports = [
    ./hardware-configuration.nix 
  ];

  # Bootloader.
  #boot.loader.systemd-boot.enable = true; 
  #boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.configurationLimit = 3;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  networking.hostName = "zyn-nixos";
  # networking.wireless.enable = true;
  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary networking.proxy.default = "http://user:password@proxy:port/"; 
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking.networkmanager.enable = true;

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
  };

  # # X11;
  # services.xserver.enable = true;
  # services.xserver = { layout = "gb"; xkbVariant = "";

  # # Gnome
  # services.xserver.displayManager.gdm.enable = true; 
  # services.xserver.desktopManager.gnome.enable = true;

  # Hyprland
  programs.hyprland.enable = true;

  # Touchpad
  services.xserver.libinput.enable = true;
  
  console.keyMap = "uk";

  # Services
  services.printing.enable = true;
  services.tlp.enable = true;
  

  # Sound (Pipewire)
  sound.enable = true; 
  hardware.pulseaudio.enable = false; 
  security.rtkit.enable = true; 
  services.pipewire = {
    enable = true; 
    alsa.enable = true; 
    alsa.support32Bit = true; 
    pulse.enable = true;
    #media-session.enable = true;
  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zyn = { 
   isNormalUser = true; 
   description = "zyn user acc"; 
   extraGroups = [ "networkmanager" "wheel" ]; 
   packages = with pkgs; [];
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # Apps
    firefox
    firefox-devedition
    discord
    wezterm
    kitty
    
    # Term
    vim
    neovim
    helix
    wget
    git
    gh
    neofetch
    eza
    starship
    hyprpaper

    # Libs / Utils
    grim
    slurp
    wl-clipboard
    tlp
  ];

  # Some programs need SUID wrappers, can be configured further or are started in user sessions. 
  # programs.mtr.enable = true; programs.gnupg.agent = {
  #   enable = true; enableSSHSupport = true;
  # };
  # Enable the OpenSSH daemon. 
  # services.openssh.enable = true;

  # Open ports in the firewall. 
  # networking.firewall.allowedTCPPorts = [ ... ]; 
  # networking.firewall.allowedUDPPorts = [ ... ]; 
  # Or disable the firewall altogether. 
  # networking.firewall.enable = false;

  # dont touch
  system.stateVersion = "23.11";
}
