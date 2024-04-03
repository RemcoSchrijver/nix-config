{ config, pkgs, ... }:

{
  imports = [
    ./hyprland/hyprland.nix
    ./waybar/waybar.nix
    ./tofi/tofi.nix
  ];
}
