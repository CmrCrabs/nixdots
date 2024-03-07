{
  description = "Flake initial test"; 
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";

    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-colors.url = "github:misterio77/nix-colors";
    matugen.url = "github:InioX/matugen";

    hyprland.url = "github:hyprwm/hyprland";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
   let 
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      wal = "~/.dotfiles/home/images/wallpapers/lambo.jpg";
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
	  extraSpecialArgs = { inherit inputs; inherit wal; };
        };
      };
    };
}
