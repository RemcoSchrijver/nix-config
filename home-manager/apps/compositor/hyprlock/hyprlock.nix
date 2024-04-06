{ osConfig, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    hyprlock
  ];

  # Link config files
  xdg.configFile = {
    "hypr/hyprlock.conf".source = ./dotfiles/hyprlock.conf;
  };
}
