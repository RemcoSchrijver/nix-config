{
  description = "System flake for my NixOS and home-manager configs";

  nixConfig = {
    trusted-substituters = [
      "https://cache.nixos.org/"
      "https://hyprland.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];

    warn-dirty = false;
  };

  inputs = {
    # Nixpkgs
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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

    # NixGL a shim necessary for non-NixOS hosts
    nixgl = {
      url = "github:nix-community/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self
    , nixpkgs
    , home-manager
    , nixos-hardware
    , systems
    , nixgl
    , ...
    } @ inputs:
    let
      lib = nixpkgs.lib // home-manager.lib;
      pkgsFor = lib.genAttrs (import systems) (
        system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        }
      );
      inherit (self) outputs;
    in
    {
      inherit lib;
      overlays = import ./overlays { inherit inputs outputs; };
      nixosConfigurations = {

        # Build for my desktop.
        desktop = nixpkgs.lib.nixosSystem rec {
          specialArgs = {
            inherit inputs outputs;
            hasUI = true;
            hasKDE = true;
            hasHyprland = true;
            hasGaming = true;
            hasBluetooth = false;
          };

          modules = [
            ./nixos/desktop/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = nixpkgs.lib.mkMerge [
                {
                  inherit inputs outputs;
                }
                specialArgs
              ];
              home-manager.users.remco.imports = [ ./home-manager/home.nix ];
              home-manager.backupFileExtension = "backup";
            }
          ];
        };

        # Build for my gaming laptop.
        laptop = nixpkgs.lib.nixosSystem rec {
          specialArgs = {
            inherit inputs outputs;
            hasUI = true;
            hasKDE = true;
            hasHyprland = false;
            hasGaming = true;
            hasBluetooth = true;
          };

          modules = [
            ./nixos/laptop/configuration.nix
            nixos-hardware.nixosModules.lenovo-legion-16ach6h-hybrid
            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = nixpkgs.lib.mkMerge [
                {
                  inherit inputs outputs;
                }
                specialArgs
              ];
              home-manager.users.remco.imports = [ ./home-manager/home.nix ];
              home-manager.backupFileExtension = "backup";
            }
          ];
        };

        # Build for my framework laptop.
        framework = nixpkgs.lib.nixosSystem rec {
          specialArgs = {
            inherit inputs outputs;
            hasUI = true;
            hasKDE = false;
            hasHyprland = true;
            hasGaming = false;
            hasBluetooth = true;
          };

          modules = [
            ./nixos/framework/configuration.nix
            # nixos-hardware.nixosModules.framework.amd-7040
            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = nixpkgs.lib.mkMerge [
                {
                  inherit inputs outputs;
                }
                specialArgs
              ];
              home-manager.users.remco.imports = [ ./home-manager/home.nix ];
              home-manager.backupFileExtension = "backup";
            }
          ];
        };

        # Build for my dev vm's
        vm = nixpkgs.lib.nixosSystem rec {
          specialArgs = {
            inherit inputs outputs;
            hasUI = false;
            hasKDE = false;
            hasHyprland = false;
            hasGaming = false;
            hasBluetooth = false;
          };

          modules = [
            ./nixos/vm/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = nixpkgs.lib.mkMerge [
                {
                  inherit inputs outputs;
                }
                specialArgs
              ];
              home-manager.users.remco.imports = [ ./home-manager/home.nix ];
              home-manager.backupFileExtension = "backup";
            }
          ];
        };
      };

      homeConfigurations = {
        # Work laptop
        work = lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            config.allowUnfree = true;
            overlays = [ nixgl.overlay ];
          };
          modules = [
            ./home-manager/nixpkgs.nix
            ./home-manager/work.nix
          ];
          extraSpecialArgs = {
            inherit inputs outputs nixgl;
          };
        };
      };
    };
}
