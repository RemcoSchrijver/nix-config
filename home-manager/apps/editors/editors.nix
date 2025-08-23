{ config, pkgs, theme, ... }:

{
  imports = [
    ./kdenlive.nix
  ];
  home.packages = with pkgs; [
    audacity
    # darktable
    drawio
    gimp
    imagemagick
    inkscape
    # ventoy-full
  ];
}
