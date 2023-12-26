{ config, pkgs, ... }:

{
  imports = [
    ./prusaslicer
    ./cad.nix
  ];
}
