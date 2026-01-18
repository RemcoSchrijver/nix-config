{ config, pkgs, theme, ... }:

{
  home.packages = [
    pkgs.rpi-imager
    # pkgs.platformio
  ];
}
