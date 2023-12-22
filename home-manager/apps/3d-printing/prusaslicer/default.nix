{ config, pkgs, theme, ... }:

{
  home.packages = [
    pkgs.prusa-slicer
  ];

  # xdg.configFile."PrusaSlicer".source = ./dotfiles;
}
