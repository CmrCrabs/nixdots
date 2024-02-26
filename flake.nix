{
  description = "Flake initial test"; 
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";

    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-colors.url = "github:misterio77/nix-colors";

    hyprland.url = "github:hyprwm/hyprland";
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
   	  modules = [ ./home-manager/home.nix ]; 
	  extraSpecialArgs = { inherit inputs; };
        };
      };
    };
}
