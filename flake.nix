{
  description = "System flake for desktop pc";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

  };

  outputs = { 
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
  inherit (self) outputs;
  in {
    nixosConfigurations = {
      remco = nixpkgs.lib.nixosSystem {
	specialArgs = {inherit inputs outputs;};

	modules = [./nixos/configuration.nix];
      };
    };
    
    homeConfigurations = {
      "remco@nixos" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; 

        extraSpecialArgs = {
            inherit inputs outputs;
            nixpkgs.config.permittedInsecurePackages = [ "openssl-1.1.1w" ];
        };

        modules = [./home-manager/home.nix];
      };
    };
  };
}
