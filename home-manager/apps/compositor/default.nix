{ config, pkgs, ... }:

{
  imports = [
    ./hyprland/hyprland.nix
    ./hyprpaper/hyprpaper.nix
    ./waybar/waybar.nix
    ./tofi/tofi.nix
  ];
}
