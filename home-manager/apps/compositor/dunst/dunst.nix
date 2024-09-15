{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    rose-pine-icon-theme
  ];
  services.dunst.enable = true;

  xdg.configFile = {
    "dunst".source = ./dotfiles;
  };
}
