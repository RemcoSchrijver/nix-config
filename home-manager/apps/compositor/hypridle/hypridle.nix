{ osConfig, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    hypridle
  ];

  # Link config files
  xdg.configFile = {
    "hypr/hypridle.conf".source = ./dotfiles/hypridle.conf;
  };
}
