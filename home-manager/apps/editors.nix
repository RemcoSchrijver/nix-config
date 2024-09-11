{ config, pkgs, theme, ... }:

{
  home.packages = with pkgs; [
    drawio
    inkscape
    gimp
    imagemagick
    darktable
    ventoy-full
  ];
}
