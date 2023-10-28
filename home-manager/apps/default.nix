{ config, pkgs, ...}:

{
  imports = [
    ./nvim/nvim.nix
    ./firefox.nix
    ./git.nix
  ];
}
