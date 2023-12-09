{ config, pkgs, theme, ... }:

{
  home.packages = [
    pkgs.jetbrains.dataspell
    pkgs.android-studio
    pkgs.jetbrains.rider
  ];
}

