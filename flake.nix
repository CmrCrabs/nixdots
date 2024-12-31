{
  description = "Flake initial test"; 
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nur.url = "github:nix-community/NUR";

    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-colors.url = "github:misterio77/nix-colors";
    matugen.url = "github:InioX/matugen";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    hyprlock.url = "github:hyprwm/hyprlock";
    hypridle.url = "github:hyprwm/hypridle";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    hyprspace = {
      url = "github:KZDKM/Hyprspace";
      inputs.hyprland.follows = "hyprland";
    };
    mcmojave-hyprcursor.url = "github:libadoxon/mcmojave-hyprcursor";

    ags.url = "github:Aylur/ags/v1";
    # ags.url = "github:Aylur/ags";
  };

  outputs = { self, nixpkgs, home-manager,nur, ... }@inputs:
  let 
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    in {

    nixosConfigurations.zyn-nixos = lib.nixosSystem {
      inherit system;
      modules = [ 
        nur.modules.nixos.default
        ./nixos/configuration.nix
      ];
      specialArgs = { inherit inputs; };
    };

    homeConfigurations.zyn = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
          # hyprland.homeManagerModules.default
          # {
          #   wayland.windowManager.hyprland.enable = true;
          # }
        ./home/home.nix 
      ]; 
      extraSpecialArgs = { inherit inputs; };
    };
  };
}
