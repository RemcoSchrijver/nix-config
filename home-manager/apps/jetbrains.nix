{ config, pkgs, theme, ... }:

{
  home.packages = [
    pkgs.jetbrains.idea
  ];
}

