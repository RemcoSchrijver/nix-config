{ config, pkgs, theme, ... }:

{
  home.packages = [
    pkgs.jetbrains.dataspell
    pkgs.jetbrains.rider
  ];
}

