{ config, pkgs, theme, ... }:

{
  home.packages = with pkgs; [
    audacity
    darktable
    drawio
    gimp
    imagemagick
    inkscape
    libsForQt5.kdenlive
    # ventoy-full
  ];
}
