# This file should be included when using hm standalone
{ outputs
, pkgs
, config
, overlays
, lib
, inputs
, ...
}:
let
  flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
in
{
  nix = {

    package = lib.mkDefault pkgs.nix;

    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";

      # Deduplicate and optimize nix store
      auto-optimise-store = true;

      # Disable global flake registry
      flake-registry = "";

      # Setting the number of cores to be used while building
      cores = 4;
      max-jobs = 8;
    };

    # Garbage collection
    gc = {
      automatic = true;
      frequency = "weekly";
      options = "--delete-older-than 60d";
    };
  };

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };
}
