{
  description = "Flake initial test"; 
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";

    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-colors.url = "github:misterio77/nix-colors";
    matugen.url = "github:InioX/matugen";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1&rev=e93fbd7c4f991cb8ef03e433ccc4d43587923e15";
    hyprlock = {
      url = "github:hyprwm/hyprlock";
    };
    hypridle = {
      url = "github:hyprwm/hypridle";
    };
    hyprspace = {
      url = "github:KZDKM/Hyprspace";
      inputs.hyprland.follows = "hyprland";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    ags.url = "github:Aylur/ags";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let 
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      zyn-nixos = lib.nixosSystem {
        inherit system;
        modules = [ 
          ./nixos/configuration.nix
        ];
        specialArgs = { inherit inputs; };
      };
    };
    homeConfigurations = {
      zyn = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home/home.nix ]; 
        extraSpecialArgs = { inherit inputs; };
      };
    };
  };
}
