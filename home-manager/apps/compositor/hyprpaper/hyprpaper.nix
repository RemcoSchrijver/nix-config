{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    hyprpaper
  ];

  # Link config 
  xdg.configFile = {
    "hypr/hyprpaper.conf".source = ./dotfiles/hyprpaper.conf;
  };

  # Link background images
  home.file.".background-images/".source = ./background-images;
}
