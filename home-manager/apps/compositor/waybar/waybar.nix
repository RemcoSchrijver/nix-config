{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
#    waybar
    playerctl
  ];

  xdg.configFile = {
    "waybar/config" = {
      source = ./dotfiles/config;
    };
    "waybar/style.css" = {
      source = ./dotfiles/style.css;
    };
    "waybar/styles" = {
      source = "${inputs.waybar-rose-pine}/";
    };
  };
}
