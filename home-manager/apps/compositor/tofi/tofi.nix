{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    tofi
  ];

  xdg.configFile = {
    "tofi".source = ./dotfiles;
  };
}
