{ config, pkgs, inputs, ... }:

{
  home.packages = [
    pkgs.rofi
    pkgs.pamixer
    pkgs.brightnessctl
    pkgs.wireplumber
    pkgs.dunst
#    pkgs.waybar
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    # Disables warning that there is not config, we import the config from our dotfiles.
    extraConfig = " ";
  };
  xdg.configFile."hypr".source = ./dotfiles;
}
