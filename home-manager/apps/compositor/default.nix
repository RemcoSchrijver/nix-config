{ config, pkgs, ... }:

{
  imports = [
    ./dunst/dunst.nix
    ./hypridle/hypridle.nix
    ./hyprland/hyprland.nix
    ./hyprlock/hyprlock.nix
    ./hyprpaper/hyprpaper.nix
    ./hyprshot/hyprshot.nix
    ./tofi/tofi.nix
    ./waybar/waybar.nix
  ];
}
