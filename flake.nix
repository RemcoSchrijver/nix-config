{
  description = "System flake for my NixOS and home-manager configs";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Hardware quirks
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # tmux plugin manager
    tmux-tpm = {
      url = "github:tmux-plugins/tpm/master";
      flake = false;
    };

    # Rosé Pine for Waybar
    waybar-rose-pine = {
      url = "github:rose-pine/waybar";
      flake = false;
    };
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

        # Build for my desktop.
        desktop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };

          modules = [
            ./nixos/desktop/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = {
                inherit inputs outputs;
              };
              home-manager.users.remco.imports = [ ./home-manager/home.nix ];
            }
          ];
        };

        # Build for my gaming laptop.
        laptop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };

          modules = [
            ./nixos/laptop/configuration.nix
            nixos-hardware.nixosModules.lenovo-legion-16ach6h-hybrid
            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = {
                inherit inputs outputs;
              };
              home-manager.users.remco.imports = [ ./home-manager/home.nix ];
            }
          ];
        };

        # Build for my thinkpad. 
        thinkpad = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };

          modules = [
            ./nixos/thinkpad/configuration.nix
            nixos-hardware.nixosModules.lenovo-thinkpad-x1-7th-gen
            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = {
                inherit inputs outputs;
              };
              home-manager.users.remco.imports = [ ./home-manager/home.nix ];
            }
          ];
        };
      };

      # homeConfigurations = {
      #   "remco@nixos" = home-manager.lib.homeManagerConfiguration {
      #     pkgs = nixpkgs.legacyPackages.${system};
      #
      #     extraSpecialArgs = {
      #       inherit inputs outputs;
      #       nixpkgs.config.permittedInsecurePackages = [ "openssl-1.1.1w" ];
      #     };
      #
      #     modules = [ ./home-manager/home.nix ];
      #   };
      # };
    };
}
