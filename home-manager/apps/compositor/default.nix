{ config, pkgs, ... }:

{
  imports = [
    ./hypridle/hypridle.nix
    ./hyprland/hyprland.nix
    ./hyprlock/hyprlock.nix
    ./hyprpaper/hyprpaper.nix
    ./hyprshot/hyprshot.nix
    ./waybar/waybar.nix
    ./tofi/tofi.nix
  ];
}
