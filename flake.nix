{
  description = "System flake for desktop pc";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Hardware quirks
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs =
    { self
    , nixpkgs
    , home-manager
    , nixos-hardware
    , ...
    } @ inputs:
    let
      inherit (self) outputs;
    in
    {
      nixosConfigurations = {
        dekstop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };

          modules = [ ./nixos/desktop/configuration.nix ];
        };
        laptop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };

          modules = [
            ./nixos/laptop/configuration.nix
            #            nixos-hardware.nixosModules.lenovo-legion-16ach6h
          ];
        };
      };

      homeConfigurations = {
        "remco@nixos" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;

          extraSpecialArgs = {
            inherit inputs outputs;
            nixpkgs.config.permittedInsecurePackages = [ "openssl-1.1.1w" ];
          };

          modules = [ ./home-manager/home.nix ];
        };
      };
    };
}
