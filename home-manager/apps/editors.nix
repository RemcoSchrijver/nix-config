{ config, pkgs, theme, ... }:

{
  home.packages = [
    pkgs.drawio
    pkgs.inkscape
  ];
}
